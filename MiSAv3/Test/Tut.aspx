<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tut.aspx.cs" Inherits="MiSAv3.Test.Tut" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Head" runat="server" ContentPlaceHolderID="Head">
    <script type="text/javascript" src="../Scripts/modal.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <link href="../Content/main.css" rel="stylesheet" />
    <link href='Themes/calendar_white.css' type="text/css" rel="stylesheet" /> 
    <link href='Themes/scheduler_white.css' type="text/css" rel="stylesheet" /> 
    <link href='Themes/month_white.css' type="text/css" rel="stylesheet" /> 
    <link href='Themes/navigator_white.css' type="text/css" rel="stylesheet" /> 
</asp:Content>

<asp:Content Runat="server" ContentPlaceHolderID="MainContent">

<style type="text/css">
    #toolbar 
    {
    	margin-bottom: 10px;
    }
    
    #toolbar a 
    {
    	display: inline-block;
    	height: 20px;
    	text-decoration: none;
    	padding: 5px;
    	color: #666;
    	border: 1px solid #aaa;

	    background: -webkit-gradient(linear, left top, left bottom, from(#fafafa), to(#e2e2e2));
	    background: -webkit-linear-gradient(top, #fafafa 0%, #e2e2e2);
	    background: -moz-linear-gradient(top, #fafafa 0%, #e2e2e2);
	    background: -ms-linear-gradient(top, #fafafa 0%, #e2e2e2);
	    background: -o-linear-gradient(top, #fafafa 0%, #e2e2e2);
	    background: linear-gradient(top, #fafafa 0%, #e2e2e2);
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr="#fafafa", endColorStr="#e2e2e2");    	
    }

</style>

<div style="float:left; width: 150px">
<DayPilot:DayPilotNavigator 
            ID="DayPilotNavigator1"
            runat="server" 
            ShowMonths="3"
            SkipMonths="3"
            ClientObjectName="dp_navigator"
        />

</div>
<div id="tabs" style="margin-left:150px">
    <div id="toolbar">
    <a href="#" id="toolbar_day">Day</a>
    <a href="#" id="toolbar_week">Week</a>
    <a href="#" id="toolbar_month">Month</a>
    </div>

    <div>
        <DayPilot:DayPilotCalendar 
        ID="DayPilotCalendarDay" 
        runat="server" 
        DataEndField="eventend"
        DataStartField="eventstart" 
        DataTextField="name" 
        DataIdField="id" 
        ViewType="Day"
        ClientObjectName="dp_day"
        OnCommand="DayPilotCalendarDay_Command"
        TimeRangeSelectedHandling="JavaScript"
        TimeRangeSelectedJavaScript="create(start, end);"
        EventClickHandling="Disabled"
        EventClickJavaScript="alert('Event with id ' + e.value() + ' clicked.')" />

        <DayPilot:DayPilotCalendar 
        ID="DayPilotCalendarWeek" 
        runat="server" 
        DataEndField="eventend"
        DataStartField="eventstart" 
        DataTextField="name" 
        DataIdField="id" 
        ViewType="Week"
        ClientObjectName="dp_week"
        OnCommand="DayPilotCalendarWeek_Command"
        TimeRangeSelectedHandling="JavaScript"
        TimeRangeSelectedJavaScript="create(start, end);"
        EventClickHandling="Disabled"
        EventClickJavaScript="alert('Event with id ' + e.value() + ' clicked.')"
        />

    <DayPilot:DayPilotMonth 
        ID="DayPilotMonth1" 
        runat="server" 
        DataEndField="eventend"
        DataStartField="eventstart" 
        DataTextField="name" 
        DataIdField="id" 
        ClientObjectName="dp_month"
        EventHeight="25"
        OnCommand="DayPilotMonth1_Command"
        TimeRangeSelectedHandling="JavaScript"
        TimeRangeSelectedJavaScript="create(start, end);"
        EventClickHandling="Disabled"
        EventClickJavaScript="alert('Event with id ' + e.value() + ' clicked.')"
        />
    </div>
</div>
<div><asp:Label runat="server" ID="ExperimentLabel" /></div>

<script type="text/javascript">
    var switcher = null;

    function create(start, end) {
        var modal = new DayPilot.Modal();
        modal.closed = function () {
            if (this.result == "OK") {
                switcher.active.control.commandCallBack('refresh');
            }
            switcher.active.control.clearSelection();
        };
        modal.showUrl("New.aspx?start=" + start + "&end=" + end);
    }

    $(document).ready(function () {
        switcher = new DayPilot.Switcher();

        switcher.addButton("toolbar_day", dp_day);
        switcher.addButton("toolbar_week", dp_week);
        switcher.addButton("toolbar_month", dp_month);

        switcher.addNavigator(dp_navigator);

        switcher.show(dp_day);
    });

</script>

</asp:Content>

