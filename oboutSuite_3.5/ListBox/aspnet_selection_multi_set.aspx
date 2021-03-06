﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="aspnet_selection_multi_set.aspx.cs" Inherits="ListBox_aspnet_selection_retrieve" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Set Selected Items</b></span>	
    
    <br /><br />
    
    <table>    
        <tr>
            <td>
                <span class="tdText">SelectedIndexes="3,4,5"</span><br />
                <obout:ListBox runat="server" ID="ListBox1" Width="200" Height="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
                    SelectedIndexes="3,4,5" SelectionMode="Multiple"
                    />
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">SelectedValue="ANATR,ALFKI,AROUT"</span><br />
                <obout:ListBox runat="server" ID="ListBox2" Width="200" Height="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
                    SelectedValue="ANATR,ALFKI,AROUT" SelectionMode="Multiple"
                    />
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Item.Selected = true;</span><br />
                <obout:ListBox runat="server" ID="ListBox3" Width="200" Height="200"
                    OnItemDataBound="ListBox3_ItemDataBound" SelectionMode="Multiple"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" />
            </td>
        </tr>
    </table>    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 25 CustomerID, CompanyName FROM Customers"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides multiple ways to set the initial selected items (for multi-item selection):<br />
        
        <ul>
            <li><b>SelectedIndexes</b> - the comma separated indexes of the items to be selected.</li>
            <li><b>SelectedValue</b> - the values of the items to be selected (the values need to be separated <br />using the character specified in the MultiSelectionSeparator property - comma by default).</li>
            <li><b>Selected</b> - this is a property of the ListBoxItem class. If set to true, the item will be selected.</li>
        </ul>
    </span>
</asp:Content>

