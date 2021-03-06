<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)
	{        
        grid1.ExportingSettings.AppendTimeStamp = AppendTimeStamp.Checked;
        grid1.ExportingSettings.ExportAllPages = ExportAllPages.Checked;
        grid1.ExportingSettings.ExportHiddenColumns = ExportHiddenColumns.Checked;
        grid1.ExportingSettings.FileName = FileName.Text;
        grid1.ExportingSettings.KeepColumnSettings = KeepColumnSettings.Checked;

        ExportOrderID.Enabled = SelectColumns.Checked;
        ExportShipName.Enabled = SelectColumns.Checked;
        ExportShipCity.Enabled = SelectColumns.Checked;
        ExportShipAddress.Enabled = SelectColumns.Checked;
        ExportShipPostalCode.Enabled = SelectColumns.Checked;
        ExportShipCountry.Enabled = SelectColumns.Checked;
        
        string columnsToExport = "";

        if (SelectColumns.Checked)
        {
            if (ExportOrderID.Checked)
            {
                columnsToExport += "OrderID,";
            }

            if (ExportShipName.Checked)
            {
                columnsToExport += "ShipName,";
            }

            if (ExportShipCity.Checked)
            {
                columnsToExport += "ShipCity,";
            }

            if (ExportShipAddress.Checked)
            {
                columnsToExport += "ShipAddress,";
            }

            if (ExportShipPostalCode.Checked)
            {
                columnsToExport += "ShipPostalCode,";
            }

            if (ExportShipCountry.Checked)
            {
                columnsToExport += "ShipCountry,";
            }
        }

        if (!string.IsNullOrEmpty(columnsToExport))
        {
            grid1.ExportingSettings.ColumnsToExport = columnsToExport.Substring(0, columnsToExport.Length - 1);
        }
        else
        {
            grid1.ExportingSettings.ColumnsToExport = "";
        }

        Downloader.Text = "";
	}

    protected void OboutButton1_Click(object sender, EventArgs e)
    {
        string fileName = grid1.ExportToExcel();

        Downloader.Text = "The Grid has been exported to an Excel file on the server. <br /><a href=\"resources/exports/" + fileName + "\">Click here to download the file.</a>";
    }

    protected void OboutButton2_Click(object sender, EventArgs e)
    {
        string fileName = grid1.ExportToWord();

        Downloader.Text = "The Grid has been exported to a Word file on the server. <br /><a href=\"resources/exports/" + fileName + "\">Click here to download the file.</a>";
    }
 </script>

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
	</head>
	<body>	
		<form id="Form1" runat="server">
					
		<br />

		<span class="tdText"><b>ASP.NET Grid - Export to Excel / Word on Server-Side</b></span>
		
		<br /><br />
		
		<table style="position: relative;">
		    <tr>
		        <td valign="top">
		            <table border="0">
		                <tr>
		                    <td class="tdText" valign="middle" colspan="2">Set the properties for exporting:</td>		        
		                </tr>
		                <tr>
		                    <td class="tdText">
                                <asp:TextBox runat="server" ID="FileName" Text="OboutGrid" CssClass="tdText" AutoPostBack="true" Width="60" />
                                File Name (without extension)
                             </td>
		                </tr>
                        <tr>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="AppendTimeStamp" Text="Append TimeStamp" AutoPostBack="true" Checked="true" />
                            </td>		                    
		                </tr>
                        <tr>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="ExportAllPages" Text="Export All Pages" AutoPostBack="true" />
                            </td>		                    
		                </tr>
                        <tr>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="KeepColumnSettings" Text="Keep Column Settings" AutoPostBack="true" />
                            </td>		                    
		                </tr>
		                <tr>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="ExportHiddenColumns" Text="Export Hidden Columns" AutoPostBack="true" />
                            </td>		                    
		                </tr>
                        <tr>
                            <td class="tdText">
                                <br />
                                <obout:OboutCheckBox runat="server" ID="SelectColumns" Text="Select the Columns to Export" AutoPostBack="true" />

                                <table cellspacing="3" style="margin-left: 20px;">
                                    <tr>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportOrderID" Text="ORDER ID" AutoPostBack="true" Checked="true" /></td>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipName" Text="NAME" AutoPostBack="true" Checked="true" /></td>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipCity" Text="CITY" AutoPostBack="true" Checked="true" /></td>
                                    </tr>
                                    <tr>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipAddress" Text="ADDRESS" AutoPostBack="true" Checked="true" /></td>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipPostalCode" Text="POSTAL CODE" AutoPostBack="true" Checked="true" /></td>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipCountry" Text="COUNTRY" AutoPostBack="true" Checked="true" /></td>
                                    </tr>
                                </table>
                            </td>		                    
		                </tr>
		            </table>
		        </td>
                <td width="50">&#160;</td>
		        <td valign="top" class="tdText">
                    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClick="OboutButton1_Click" />
                    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClick="OboutButton2_Click" />

                    <br /><br />

                    <asp:Literal runat="server" ID="Downloader" />
		        </td>
		    </tr>
		</table>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" AutoGenerateColumns="false" DataSourceID="sds1" 
            FolderExports="resources/exports" AllowAddingRecords="false">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="250" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" Align="right" HeaderAlign="right" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipAddress" Visible="false" HeaderText="ADDRESS" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column6" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
			</Columns>
            <ExportingSettings ExportedFilesLifeTime="5" />
		</obout:Grid>

        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<div class="tdText">
            The Grid exposes two server-side methods that allow users to export the data to Excel / Word:
            <ul>
                <li><b>ExportToExcel</b> - exports the Grid to Excel.</li>
                <li><b>ExportToWord</b> - exports the Grid to Word.</li>
            </ul>
            
            <br />

            The Grid is exported according to the settings specified using the <b>ExportingSettings</b> property.

            <br /><br />

            When using the server-side exporting feature, the exported files will be created on the server and won't be served to the user's browser. <br />
            Special security permissions are required on the server, otherwise the files cannot be created.<br />
            The files will be saved in the location specified by the <b>FolderExports</b> property.
		</div>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>
		
		</form>
	</body>
</html>