﻿<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_master_detail_separate_form.aspx.vb" Inherits="SuperForm_vb_master_detail_separate_form" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Master / Detail - Add / Edit in Separate Page</b></span>
    
    <br /><br />

    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />
   
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Orders] WHERE OrderID = @OrderID"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipCountry=@ShipCountry,
                         OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate WHERE OrderID=@OrderID">
        <SelectParameters>
            <asp:QueryStringParameter Name="OrderID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />

    <br /><br />
    
    <span class="tdText">
        The Super Form can be used as a detail view for various scenarios. <br /><br />
        This example showcases the use of a Grid as the master control. The Super Form is placed on a different page.<br />
        When a record is selected in the Grid, the page containing the form will be opened. <br />
        The form will be populated with all the details for the selected row.<br />
        The end users can modify all the fields and hit Update. The page with the Grid will be reloaded and the changes <br />
        will be persisted into the database and the Grid will also be updated to reflect the changes.
    </span>
</asp:Content>

