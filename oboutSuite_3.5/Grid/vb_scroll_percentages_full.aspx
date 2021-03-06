﻿<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script type="text/C#" runat="server">

    Private grid1 As New Grid()

    Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AllowGrouping = True
        grid1.AutoGenerateColumns = True
        grid1.AllowAddingRecords = False
    
        grid1.FolderStyle = "styles/black_glass"
        grid1.AllowFiltering = True
        grid1.PageSize = 100
    
        grid1.ScrollingSettings.ScrollWidth = Unit.Percentage(100)
        grid1.ScrollingSettings.ScrollHeight = Unit.Percentage(100)
    
        grid1.DataSourceID = "sds1"
    
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub

</script>

<html>
    <head>
        <title>obout ASP.NET Grid examples</title>
        <style type="text/css">
            .tdText
            {
                font: 11px Verdana;
                color: #333333;
            }
            .option2
            {
                font: 11px Verdana;
                color: #0033cc;
                padding-left: 4px;
                padding-right: 4px;
            }
            a
            {
                font: 11px Verdana;
                color: #315686;
                text-decoration: underline;
            }
            a:hover
            {
                color: crimson;
            }
            
            html, body, form
            {
                height: 100%;
                padding: 0px;
                margin: 0px;
                overflow: hidden;
            }
            
            .ob_gBody
            {
                border-bottom: 1px solid #EEEEEE;
            }
        </style>
    </head>
    <body>
        <form id="Form1" runat="server">           
            <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>        
              
            <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 250 * FROM Orders"
    		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
        </form>
    </body>
</html>

