﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="GridView.GridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {background-color:#d5f5f5;}
        table {border-spacing:0px;}
        #centerme {background-color:#ffffff; height:300px; width:1050px; overflow:auto; position:absolute; top:150px; left:150px; border-radius:20px;}
        th {background-color:#aaaaaa; padding-left:15px; padding-right:15px; padding-top:15px;}
        tr:nth-child(odd){background-color:#ddddee;}
        td:first-child{width:90px; padding-left:15px; padding-right:15px; padding-bottom:15px; padding-top:15px;}
        td:nth-child(2){padding-left:15px; padding-right:15px; padding-bottom:15px; padding-top:15px;}
        td:nth-child(3){width:40px;}
        td:nth-child(4){width:170px;}
        td:nth-child(5){width:170px;}
        td:nth-child(6){width:170px;}
        td{padding-left:35px; padding-right:35px; padding-bottom:15px; padding-top:15px;}
        ::-webkit-scrollbar{width:10px;}
        ::-webkit-scrollbar-track{box-shadow: inset 0 0 5px grey; border-radius:10px;}
        ::-webkit-scrollbar-thumb{background: rgba(200,200,200,0.6); border-radius:10px;}
        ::-webkit-scrollbar-thumb:hover{background: rgba(100,100,100,0.4);}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="centerme">
            <asp:GridView
                ID="GridView1" Font-Names="Arial" Font-Size="Smaller"
                AutoGeneratedColomns="false"
                AutoGeneratedEditButton="true"
                AutoGeneratedDeleteButton="false"
                DataSourceID="sqlDataSource1"
                DataKeyNames="ProductID"
                runat="server">

                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server"
                                onClientClick="return confirm('Are you sure?');"
                                CommandName="Delete">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="ProductID" HeaderText="ProductID"
                        SortExpression="ProductID" ReadOnly="true" />
                    <asp:BoundField DataField="title" HeaderText="Title"
                        SortExpression="title"/>
                    <asp:BoundField DataField="authors" HeaderText="Authors"
                        SortExpression="authors"/>
                    <asp:BoundField DataField="description" HeaderText="Description"
                        SortExpression="description"/>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource
                ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:connStr %>"
                SelectCommand="SELECT ProductID, title, authors, description FROM Products_Lab5"
                UpdateCommand="UPDATE Products_Lab5 SET title=@title, authors=@authors, description=@description WHERE ProductID=@ProductID"
                DeleteCommand="DELTE FROM Products_Lab5 WHERE ProductID=@ProductID">

                <UpdateParameters>
                    <asp:Parameter Name="title" />
                    <asp:Parameter Name="authors" />
                    <asp:Parameter Name="description" />
                </UpdateParameters>

                <DeleteParameters>
                    <asp:Parameter Name="ProductID" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
