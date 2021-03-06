<%@ Page Language="C#" Debug="true" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FilterCriteria criteria1 = new FilterCriteria();
            // use "Between" filter option (with index 0 in FilterOptions collection)
            CustomFilterOption option1 = grid1.Columns[2].FilterOptions[0] as CustomFilterOption;

            criteria1.Option = option1;
            criteria1.Values = new Hashtable();
            criteria1.Values["StartDate_OrderDate"] = "1/1/1994";
            criteria1.Values["EndDate_OrderDate"] = "10/1/1994";

            grid1.Columns[2].FilterCriteria = criteria1;



            FilterCriteria criteria2 = new FilterCriteria();
            // use "Filter By Year And Month" filter option (with index 3 in FilterOptions collection)
            CustomFilterOption option2= grid1.Columns[3].FilterOptions[3] as CustomFilterOption;

            criteria2.Option = option2;
            criteria2.Values = new Hashtable();
            criteria2.Values["YearMonth_Year_ShippedDate"] = "1994";
            criteria2.Values["YearMonth_Month_ShippedDate"] = "9";

            grid1.Columns[3].FilterCriteria = criteria2;



            FilterCriteria criteria3= new FilterCriteria();
            // use "Filter By Month" filter option (with index 2 in FilterOptions collection)
            CustomFilterOption option3 = grid1.Columns[4].FilterOptions[2] as CustomFilterOption;

            criteria3.Option = option3;
            criteria3.Values = new Hashtable();
            criteria3.Values["Month_RequiredDate"] = "10";

            grid1.Columns[4].FilterCriteria = criteria3;
        }
    }
    
    protected void grid1_Filtering(object sender, EventArgs e)
    {
        // filter for OrderDate
        Column orderDateColumn = grid1.Columns[2];

        if (orderDateColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = orderDateColumn.FilterCriteria.Option as CustomFilterOption;
            
            switch (filterOption.ID)
            {
                case "Between_OrderDate":
                    string startDate = orderDateColumn.FilterCriteria.Values["StartDate_OrderDate"].ToString();
                    string endDate = orderDateColumn.FilterCriteria.Values["EndDate_OrderDate"].ToString();

                    if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                    {
                        // we filter between start date at 12:00AM and end date at 11:59PM
                        orderDateColumn.FilterCriteria.FilterExpression = "(" + orderDateColumn.DataField + " >= #" + startDate + " 12:00:00 AM# AND " + orderDateColumn.DataField + " <= #" + endDate + " 11:59:59 PM#)";
                    }
                    break;

                case "ByYear_OrderDate":
                    string year = orderDateColumn.FilterCriteria.Values["Year_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '%/" + year + " %'";
                    
                    break;

                case "ByMonth_OrderDate":
                    string month = orderDateColumn.FilterCriteria.Values["Month_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '" + month + "/%'";

                    break;

                case "ByYearAndMonth_OrderDate":
                    string year2 = orderDateColumn.FilterCriteria.Values["YearMonth_Year_OrderDate"].ToString();
                    string month2 = orderDateColumn.FilterCriteria.Values["YearMonth_Month_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "(CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '" + month2 + "/%') AND (CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '%/" + year2 + " %')";
                    break;
            }
        }



        // filter for ShippedDate
        Column shippedDateColumn = grid1.Columns[3];

        if (shippedDateColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = shippedDateColumn.FilterCriteria.Option as CustomFilterOption;

            switch (filterOption.ID)
            {
                case "Between_ShippedDate":
                    string startDate = shippedDateColumn.FilterCriteria.Values["StartDate_ShippedDate"].ToString();
                    string endDate = shippedDateColumn.FilterCriteria.Values["EndDate_ShippedDate"].ToString();

                    if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                    {
                        // we filter between start date at 12:00AM and end date at 11:59PM
                        shippedDateColumn.FilterCriteria.FilterExpression = "(" + shippedDateColumn.DataField + " >= #" + startDate + " 12:00:00 AM# AND " + shippedDateColumn.DataField + " <= #" + endDate + " 11:59:59 PM#)";
                    }
                    break;

                case "ByYear_ShippedDate":
                    string year = shippedDateColumn.FilterCriteria.Values["Year_ShippedDate"].ToString();
                    shippedDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + shippedDateColumn.DataField + ", 'System.String') LIKE '%/" + year + " %'";

                    break;

                case "ByMonth_ShippedDate":
                    string month = shippedDateColumn.FilterCriteria.Values["Month_ShippedDate"].ToString();
                    shippedDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + shippedDateColumn.DataField + ", 'System.String') LIKE '" + month + "/%'";

                    break;

                case "ByYearAndMonth_ShippedDate":
                    string year2 = shippedDateColumn.FilterCriteria.Values["YearMonth_Year_ShippedDate"].ToString();
                    string month2 = shippedDateColumn.FilterCriteria.Values["YearMonth_Month_ShippedDate"].ToString();
                    shippedDateColumn.FilterCriteria.FilterExpression = "(CONVERT(" + shippedDateColumn.DataField + ", 'System.String') LIKE '" + month2 + "/%') AND (CONVERT(" + shippedDateColumn.DataField + ", 'System.String') LIKE '%/" + year2 + " %')";
                    break;
            }
        }



        // filter for RequiredDate
        Column requiredDateColumn = grid1.Columns[4];

        if (requiredDateColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = requiredDateColumn.FilterCriteria.Option as CustomFilterOption;

            switch (filterOption.ID)
            {
                case "Between_RequiredDate":
                    string startDate = requiredDateColumn.FilterCriteria.Values["StartDate_RequiredDate"].ToString();
                    string endDate = requiredDateColumn.FilterCriteria.Values["EndDate_RequiredDate"].ToString();

                    if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                    {
                        // we filter between start date at 12:00AM and end date at 11:59PM
                        requiredDateColumn.FilterCriteria.FilterExpression = "(" + requiredDateColumn.DataField + " >= #" + startDate + " 12:00:00 AM# AND " + requiredDateColumn.DataField + " <= #" + endDate + " 11:59:59 PM#)";
                    }
                    break;

                case "ByYear_RequiredDate":
                    string year = requiredDateColumn.FilterCriteria.Values["Year_RequiredDate"].ToString();
                    requiredDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + requiredDateColumn.DataField + ", 'System.String') LIKE '%/" + year + " %'";

                    break;

                case "ByMonth_RequiredDate":
                    string month = requiredDateColumn.FilterCriteria.Values["Month_RequiredDate"].ToString();
                    requiredDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + requiredDateColumn.DataField + ", 'System.String') LIKE '" + month + "/%'";

                    break;

                case "ByYearAndMonth_RequiredDate":
                    string year2 = requiredDateColumn.FilterCriteria.Values["YearMonth_Year_RequiredDate"].ToString();
                    string month2 = requiredDateColumn.FilterCriteria.Values["YearMonth_Month_RequiredDate"].ToString();
                    requiredDateColumn.FilterCriteria.FilterExpression = "(CONVERT(" + requiredDateColumn.DataField + ", 'System.String') LIKE '" + month2 + "/%') AND (CONVERT(" + requiredDateColumn.DataField + ", 'System.String') LIKE '%/" + year2 + " %')";
                    break;
            }
        }
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
			.floating
			{
			    float: left;
			    padding-right: 10px;
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
			
			.separator
			{
			    width: 8%;
			    color: #000;
			    display:-moz-inline-stack;
                display:inline-block;
                zoom:1;
                *display:inline;
                text-align:center;
                top: -7px;
                position: relative;
                font-size: 10px;
                height: 5px;
			}
		</style>
			
	</head>	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Date Filters</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" AllowPageSizeSelection="false"
			AllowFiltering="true" OnFiltering="grid1_Filtering">
			<Columns>
			    <obout:Column ID="Column1" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
			    <obout:Column ID="Column5" DataField="ShipName" HeaderText="NAME" runat="server"/>
				
				<obout:Column ID="Column2" DataFormatString="{0:M/d/yyyy}" DataField="OrderDate" HeaderText="ORDER DATE" Width="200" runat="server">
				    <FilterOptions>
				        <obout:CustomFilterOption IsDefault="true" ID="Between_OrderDate" Text="Between">
				            <TemplateSettings FilterTemplateId="OrderDateBetweenFilter" 
				                FilterControlsIds="StartDate_OrderDate,EndDate_OrderDate"
				                FilterControlsPropertyNames="value,value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByYear_OrderDate" Text="Filter By Year">
				            <TemplateSettings FilterTemplateId="OrderDateByYearFilter" 
				                FilterControlsIds="Year_OrderDate"
				                FilterControlsPropertyNames="value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByMonth_OrderDate" Text="Filter By Month">
				            <TemplateSettings FilterTemplateId="OrderDateByMonthFilter" 
				                FilterControlsIds="Month_OrderDate"
				                FilterControlsPropertyNames="value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByYearAndMonth_OrderDate" Text="Filter By Year And Month">
				            <TemplateSettings FilterTemplateId="OrderDateByYearAndMonthFilter" 
				                FilterControlsIds="YearMonth_Year_OrderDate,YearMonth_Month_OrderDate"
				                FilterControlsPropertyNames="value,value" />
				        </obout:CustomFilterOption>
				    </FilterOptions>
				</obout:Column>
				
				<obout:Column ID="Column3" DataFormatString="{0:M/d/yyyy}" DataField="ShippedDate" HeaderText="SHIPPED DATE" Width="200" runat="server">
				    <FilterOptions>
				        <obout:CustomFilterOption IsDefault="true" ID="Between_ShippedDate" Text="Between">
				            <TemplateSettings FilterTemplateId="ShippedDateBetweenFilter" 
				                FilterControlsIds="StartDate_ShippedDate,EndDate_ShippedDate"
				                FilterControlsPropertyNames="value,value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByYear_ShippedDate" Text="Filter By Year">
				            <TemplateSettings FilterTemplateId="ShippedDateByYearFilter" 
				                FilterControlsIds="Year_ShippedDate"
				                FilterControlsPropertyNames="value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByMonth_ShippedDate" Text="Filter By Month">
				            <TemplateSettings FilterTemplateId="ShippedDateByMonthFilter" 
				                FilterControlsIds="Month_ShippedDate"
				                FilterControlsPropertyNames="value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByYearAndMonth_ShippedDate" Text="Filter By Year And Month">
				            <TemplateSettings FilterTemplateId="ShippedDateByYearAndMonthFilter" 
				                FilterControlsIds="YearMonth_Year_ShippedDate,YearMonth_Month_ShippedDate"
				                FilterControlsPropertyNames="value,value" />
				        </obout:CustomFilterOption>
				    </FilterOptions>
				</obout:Column>
				
				<obout:Column ID="Column4" DataFormatString="{0:M/d/yyyy}" DataField="RequiredDate" HeaderText="REQUIRED DATE" Width="200" runat="server">
				    <FilterOptions>
				        <obout:CustomFilterOption IsDefault="true" ID="Between_RequiredDate" Text="Between">
				            <TemplateSettings FilterTemplateId="RequiredDateBetweenFilter" 
				                FilterControlsIds="StartDate_RequiredDate,EndDate_RequiredDate"
				                FilterControlsPropertyNames="value,value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByYear_RequiredDate" Text="Filter By Year">
				            <TemplateSettings FilterTemplateId="RequiredDateByYearFilter" 
				                FilterControlsIds="Year_RequiredDate"
				                FilterControlsPropertyNames="value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByMonth_RequiredDate" Text="Filter By Month">
				            <TemplateSettings FilterTemplateId="RequiredDateByMonthFilter" 
				                FilterControlsIds="Month_RequiredDate"
				                FilterControlsPropertyNames="value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByYearAndMonth_RequiredDate" Text="Filter By Year And Month">
				            <TemplateSettings FilterTemplateId="RequiredDateByYearAndMonthFilter" 
				                FilterControlsIds="YearMonth_Year_RequiredDate,YearMonth_Month_RequiredDate"
				                FilterControlsPropertyNames="value,value" />
				        </obout:CustomFilterOption>
				    </FilterOptions>
				</obout:Column>
			</Columns>
			<FilteringSettings InitialState="Visible" />
			<Templates>
			    <obout:GridTemplate runat="server" ID="OrderDateBetweenFilter">
			        <Template>
			            <div style="width: 99%;padding: 0px;margin: 0px; font-size: 5px;">
			                <obout:OboutTextBox runat="server" ID="StartDate_OrderDate" Width="45%" />
			                <div class="separator">-</div>
			                <obout:OboutTextBox runat="server" ID="EndDate_OrderDate" Width="45%" />
			            </div>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="ShippedDateBetweenFilter">
			        <Template>
			            <div style="width: 99%;padding: 0px;margin: 0px; font-size: 5px;">
			                <obout:OboutTextBox runat="server" ID="StartDate_ShippedDate" Width="45%" />
			                <div class="separator">-</div>
			                <obout:OboutTextBox runat="server" ID="EndDate_ShippedDate" Width="45%" />
			            </div>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="RequiredDateBetweenFilter">
			        <Template>
			            <div style="width: 99%;padding: 0px;margin: 0px; font-size: 5px;">
			                <obout:OboutTextBox runat="server" ID="StartDate_RequiredDate" Width="45%" />
			                <div class="separator">-</div>
			                <obout:OboutTextBox runat="server" ID="EndDate_RequiredDate" Width="45%" />
			            </div>
			        </Template>
			    </obout:GridTemplate>
			    
			    
			    <obout:GridTemplate runat="server" ID="OrderDateByYearFilter">
			        <Template>
			            <obout:OboutDropDownList runat="server" ID="Year_OrderDate" Width="100%" Height="150">
			                <asp:ListItem>1994</asp:ListItem>
			                <asp:ListItem>1995</asp:ListItem>
			                <asp:ListItem>1996</asp:ListItem>
			                <asp:ListItem>1997</asp:ListItem>
			                <asp:ListItem>1998</asp:ListItem>
			                <asp:ListItem>1999</asp:ListItem>
			                <asp:ListItem>2000</asp:ListItem>
			                <asp:ListItem>2001</asp:ListItem>
			                <asp:ListItem>2002</asp:ListItem>
			                <asp:ListItem>2003</asp:ListItem>
			                <asp:ListItem>2004</asp:ListItem>
			                <asp:ListItem>2005</asp:ListItem>
			                <asp:ListItem>2006</asp:ListItem>
			                <asp:ListItem>2007</asp:ListItem>
			                <asp:ListItem>2008</asp:ListItem>
			                <asp:ListItem>2009</asp:ListItem>
			                <asp:ListItem>2010</asp:ListItem>
			            </obout:OboutDropDownList>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="ShippedDateByYearFilter">
			        <Template>
			            <obout:OboutDropDownList runat="server" ID="Year_ShippedDate" Width="100%" Height="150">
			                <asp:ListItem>1994</asp:ListItem>
			                <asp:ListItem>1995</asp:ListItem>
			                <asp:ListItem>1996</asp:ListItem>
			                <asp:ListItem>1997</asp:ListItem>
			                <asp:ListItem>1998</asp:ListItem>
			                <asp:ListItem>1999</asp:ListItem>
			                <asp:ListItem>2000</asp:ListItem>
			                <asp:ListItem>2001</asp:ListItem>
			                <asp:ListItem>2002</asp:ListItem>
			                <asp:ListItem>2003</asp:ListItem>
			                <asp:ListItem>2004</asp:ListItem>
			                <asp:ListItem>2005</asp:ListItem>
			                <asp:ListItem>2006</asp:ListItem>
			                <asp:ListItem>2007</asp:ListItem>
			                <asp:ListItem>2008</asp:ListItem>
			                <asp:ListItem>2009</asp:ListItem>
			                <asp:ListItem>2010</asp:ListItem>
			            </obout:OboutDropDownList>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="RequiredDateByYearFilter">
			        <Template>
			            <obout:OboutDropDownList runat="server" ID="Year_RequiredDate" Width="100%" Height="150">
			                <asp:ListItem>1994</asp:ListItem>
			                <asp:ListItem>1995</asp:ListItem>
			                <asp:ListItem>1996</asp:ListItem>
			                <asp:ListItem>1997</asp:ListItem>
			                <asp:ListItem>1998</asp:ListItem>
			                <asp:ListItem>1999</asp:ListItem>
			                <asp:ListItem>2000</asp:ListItem>
			                <asp:ListItem>2001</asp:ListItem>
			                <asp:ListItem>2002</asp:ListItem>
			                <asp:ListItem>2003</asp:ListItem>
			                <asp:ListItem>2004</asp:ListItem>
			                <asp:ListItem>2005</asp:ListItem>
			                <asp:ListItem>2006</asp:ListItem>
			                <asp:ListItem>2007</asp:ListItem>
			                <asp:ListItem>2008</asp:ListItem>
			                <asp:ListItem>2009</asp:ListItem>
			                <asp:ListItem>2010</asp:ListItem>
			            </obout:OboutDropDownList>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="OrderDateByMonthFilter">
			        <Template>
			            <obout:OboutDropDownList runat="server" ID="Month_OrderDate" Width="100%" Height="150">
			                <asp:ListItem Value="1">January</asp:ListItem>
			                <asp:ListItem Value="2">February</asp:ListItem>
			                <asp:ListItem Value="3">March</asp:ListItem>
			                <asp:ListItem Value="4">April</asp:ListItem>
			                <asp:ListItem Value="5">May</asp:ListItem>
			                <asp:ListItem Value="6">June</asp:ListItem>
			                <asp:ListItem Value="7">July</asp:ListItem>
			                <asp:ListItem Value="8">August</asp:ListItem>
			                <asp:ListItem Value="9">September</asp:ListItem>
			                <asp:ListItem Value="10">October</asp:ListItem>
			                <asp:ListItem Value="11">November</asp:ListItem>
			                <asp:ListItem Value="12">December</asp:ListItem>
			            </obout:OboutDropDownList>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="ShippedDateByMonthFilter">
			        <Template>
			            <obout:OboutDropDownList runat="server" ID="Month_ShippedDate" Width="100%" Height="150">
			                <asp:ListItem Value="1">January</asp:ListItem>
			                <asp:ListItem Value="2">February</asp:ListItem>
			                <asp:ListItem Value="3">March</asp:ListItem>
			                <asp:ListItem Value="4">April</asp:ListItem>
			                <asp:ListItem Value="5">May</asp:ListItem>
			                <asp:ListItem Value="6">June</asp:ListItem>
			                <asp:ListItem Value="7">July</asp:ListItem>
			                <asp:ListItem Value="8">August</asp:ListItem>
			                <asp:ListItem Value="9">September</asp:ListItem>
			                <asp:ListItem Value="10">October</asp:ListItem>
			                <asp:ListItem Value="11">November</asp:ListItem>
			                <asp:ListItem Value="12">December</asp:ListItem>
			            </obout:OboutDropDownList>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="RequiredDateByMonthFilter">
			        <Template>
			            <obout:OboutDropDownList runat="server" ID="Month_RequiredDate" Width="100%" Height="150">
			                <asp:ListItem Value="1">January</asp:ListItem>
			                <asp:ListItem Value="2">February</asp:ListItem>
			                <asp:ListItem Value="3">March</asp:ListItem>
			                <asp:ListItem Value="4">April</asp:ListItem>
			                <asp:ListItem Value="5">May</asp:ListItem>
			                <asp:ListItem Value="6">June</asp:ListItem>
			                <asp:ListItem Value="7">July</asp:ListItem>
			                <asp:ListItem Value="8">August</asp:ListItem>
			                <asp:ListItem Value="9">September</asp:ListItem>
			                <asp:ListItem Value="10">October</asp:ListItem>
			                <asp:ListItem Value="11">November</asp:ListItem>
			                <asp:ListItem Value="12">December</asp:ListItem>
			            </obout:OboutDropDownList>
			        </Template>
			    </obout:GridTemplate>
			    
			    
			    <obout:GridTemplate runat="server" ID="OrderDateByYearAndMonthFilter">
			        <Template>
			            <div style="width: 100%;padding: 0px;margin: 0px; font-size: 5px;">
			                <obout:OboutDropDownList runat="server" ID="YearMonth_Year_OrderDate" Width="49%" Height="150">
			                    <asp:ListItem>1994</asp:ListItem>
			                    <asp:ListItem>1995</asp:ListItem>
			                    <asp:ListItem>1996</asp:ListItem>
			                    <asp:ListItem>1997</asp:ListItem>
			                    <asp:ListItem>1998</asp:ListItem>
			                    <asp:ListItem>1999</asp:ListItem>
			                    <asp:ListItem>2000</asp:ListItem>
			                    <asp:ListItem>2001</asp:ListItem>
			                    <asp:ListItem>2002</asp:ListItem>
			                    <asp:ListItem>2003</asp:ListItem>
			                    <asp:ListItem>2004</asp:ListItem>
			                    <asp:ListItem>2005</asp:ListItem>
			                    <asp:ListItem>2006</asp:ListItem>
			                    <asp:ListItem>2007</asp:ListItem>
			                    <asp:ListItem>2008</asp:ListItem>
			                    <asp:ListItem>2009</asp:ListItem>
			                    <asp:ListItem>2010</asp:ListItem>
			                </obout:OboutDropDownList>
			                <obout:OboutDropDownList runat="server" ID="YearMonth_Month_OrderDate" Width="49%" Height="150" MenuWidth="125">
			                    <asp:ListItem Value="1">January</asp:ListItem>
			                    <asp:ListItem Value="2">February</asp:ListItem>
			                    <asp:ListItem Value="3">March</asp:ListItem>
			                    <asp:ListItem Value="4">April</asp:ListItem>
			                    <asp:ListItem Value="5">May</asp:ListItem>
			                    <asp:ListItem Value="6">June</asp:ListItem>
			                    <asp:ListItem Value="7">July</asp:ListItem>
			                    <asp:ListItem Value="8">August</asp:ListItem>
			                    <asp:ListItem Value="9">September</asp:ListItem>
			                    <asp:ListItem Value="10">October</asp:ListItem>
			                    <asp:ListItem Value="11">November</asp:ListItem>
			                    <asp:ListItem Value="12">December</asp:ListItem>
			                </obout:OboutDropDownList>
			            </div>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="ShippedDateByYearAndMonthFilter">
			        <Template>
			            <div style="width: 100%;padding: 0px;margin: 0px; font-size: 5px;">
			                <obout:OboutDropDownList runat="server" ID="YearMonth_Year_ShippedDate" Width="49%" Height="150">
			                    <asp:ListItem>1994</asp:ListItem>
			                    <asp:ListItem>1995</asp:ListItem>
			                    <asp:ListItem>1996</asp:ListItem>
			                    <asp:ListItem>1997</asp:ListItem>
			                    <asp:ListItem>1998</asp:ListItem>
			                    <asp:ListItem>1999</asp:ListItem>
			                    <asp:ListItem>2000</asp:ListItem>
			                    <asp:ListItem>2001</asp:ListItem>
			                    <asp:ListItem>2002</asp:ListItem>
			                    <asp:ListItem>2003</asp:ListItem>
			                    <asp:ListItem>2004</asp:ListItem>
			                    <asp:ListItem>2005</asp:ListItem>
			                    <asp:ListItem>2006</asp:ListItem>
			                    <asp:ListItem>2007</asp:ListItem>
			                    <asp:ListItem>2008</asp:ListItem>
			                    <asp:ListItem>2009</asp:ListItem>
			                    <asp:ListItem>2010</asp:ListItem>
			                </obout:OboutDropDownList>
			                <obout:OboutDropDownList runat="server" ID="YearMonth_Month_ShippedDate" Width="49%" Height="150" MenuWidth="125">
			                    <asp:ListItem Value="1">January</asp:ListItem>
			                    <asp:ListItem Value="2">February</asp:ListItem>
			                    <asp:ListItem Value="3">March</asp:ListItem>
			                    <asp:ListItem Value="4">April</asp:ListItem>
			                    <asp:ListItem Value="5">May</asp:ListItem>
			                    <asp:ListItem Value="6">June</asp:ListItem>
			                    <asp:ListItem Value="7">July</asp:ListItem>
			                    <asp:ListItem Value="8">August</asp:ListItem>
			                    <asp:ListItem Value="9">September</asp:ListItem>
			                    <asp:ListItem Value="10">October</asp:ListItem>
			                    <asp:ListItem Value="11">November</asp:ListItem>
			                    <asp:ListItem Value="12">December</asp:ListItem>
			                </obout:OboutDropDownList>
			            </div>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="RequiredDateByYearAndMonthFilter">
			        <Template>
			            <div style="width: 100%;padding: 0px;margin: 0px; font-size: 5px;">
			                <obout:OboutDropDownList runat="server" ID="YearMonth_Year_RequiredDate" Width="49%" Height="150">
			                    <asp:ListItem>1994</asp:ListItem>
			                    <asp:ListItem>1995</asp:ListItem>
			                    <asp:ListItem>1996</asp:ListItem>
			                    <asp:ListItem>1997</asp:ListItem>
			                    <asp:ListItem>1998</asp:ListItem>
			                    <asp:ListItem>1999</asp:ListItem>
			                    <asp:ListItem>2000</asp:ListItem>
			                    <asp:ListItem>2001</asp:ListItem>
			                    <asp:ListItem>2002</asp:ListItem>
			                    <asp:ListItem>2003</asp:ListItem>
			                    <asp:ListItem>2004</asp:ListItem>
			                    <asp:ListItem>2005</asp:ListItem>
			                    <asp:ListItem>2006</asp:ListItem>
			                    <asp:ListItem>2007</asp:ListItem>
			                    <asp:ListItem>2008</asp:ListItem>
			                    <asp:ListItem>2009</asp:ListItem>
			                    <asp:ListItem>2010</asp:ListItem>
			                </obout:OboutDropDownList>
			                <obout:OboutDropDownList runat="server" ID="YearMonth_Month_RequiredDate" Width="49%" Height="150" MenuWidth="125">
			                    <asp:ListItem Value="1">January</asp:ListItem>
			                    <asp:ListItem Value="2">February</asp:ListItem>
			                    <asp:ListItem Value="3">March</asp:ListItem>
			                    <asp:ListItem Value="4">April</asp:ListItem>
			                    <asp:ListItem Value="5">May</asp:ListItem>
			                    <asp:ListItem Value="6">June</asp:ListItem>
			                    <asp:ListItem Value="7">July</asp:ListItem>
			                    <asp:ListItem Value="8">August</asp:ListItem>
			                    <asp:ListItem Value="9">September</asp:ListItem>
			                    <asp:ListItem Value="10">October</asp:ListItem>
			                    <asp:ListItem Value="11">November</asp:ListItem>
			                    <asp:ListItem Value="12">December</asp:ListItem>
			                </obout:OboutDropDownList>
			            </div>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    The <b>CustomFilterOption</b> class allows you to create new filter options that are more advanced than the standard ones offered by the Grid.<br />
		    Each custom option may have a template applied to it and you can have a different template for each custom filter option. <br /><br />
		    You can use the <b>OnFiltering</b> server-side event to generate the appropriate filter expressions for each column, <br />
		    based on the values of the fields from the filter options templates.<br /><br />
		    In this example we have created four custom filter options for each date column.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>
		
		</form>
	</body>
</html>