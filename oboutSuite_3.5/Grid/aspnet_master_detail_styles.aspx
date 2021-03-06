﻿<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>
		<link href="resources/custom-styles/black_glass/style.css" rel="Stylesheet" type="text/css" />	
		<link href="resources/custom-styles/grand_gray/style.css" rel="Stylesheet" type="text/css" />		
		<link href="resources/custom-styles/premiere_blue/style.css" rel="Stylesheet" type="text/css" />		
	</head>
	<body>	
		<form id="Form1" runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Different Styles</b></span>		
		
		<br /><br />
		<div class="master">
		    <obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" AllowPageSizeSelection="false"
		        DataSourceID="sds1" FolderStyle="_" AllowAddingRecords="false">
                <Columns>
                    <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false"></obout:Column>
                    <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"></obout:Column>
                    <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                    <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>                
                </Columns>
                <CssSettings CSSFolderImages="resources/custom-styles/black_glass" /> 
                <MasterDetailSettings LoadingMode="OnCallback" />
                <DetailGrids>
                    <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                     AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                     DataSourceID="sds2" FolderStyle="_" ForeignKeys="CustomerID">
                        <Columns>
                            <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false"></obout:Column>
                            <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                            <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="217"></obout:Column>
                            <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
                            <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}"></obout:Column>
                        </Columns>
                        <CssSettings CSSFolderImages="resources/custom-styles/premiere_blue" /> 	
                        <MasterDetailSettings LoadingMode="OnCallback" />
                        <DetailGrids>
                            <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false" 
                                 AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                                 DataSourceID="sds3" FolderStyle="_" ForeignKeys="OrderID">
                                    <Columns>
                                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>                                
                                        <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}" Width="180"></obout:Column>
                                        <obout:Column DataField="Quantity" HeaderText="QUANTITY" Width="185"></obout:Column>
                                        <obout:Column DataField="Discount" HeaderText="DISCOUNT" DataFormatString="{0:F2}%" Width="175"></obout:Column>
                                    </Columns>
                                    <CssSettings CSSFolderImages="resources/custom-styles/grand_gray" /> 
                            </obout:DetailGrid>
                        </DetailGrids>
                    </obout:DetailGrid>
                </DetailGrids>
            </obout:Grid>
		</div>
		<br /><br />				

				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
	
		<span class="tdText">
		You can have Master / Detail Grids with different styles on the same page, by using the CssSettings property <br />or by using custom stylesheets.
        <br /><br />
        CssSettings should be used for minor customizations, custom stylesheets should be used when using many <br />controls with different styles on the same page (as in this example).

		<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_styles_advanced.aspx">Advanced Styles Tutorial</a>
		</span>
		
		<br /><br /><br />
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>