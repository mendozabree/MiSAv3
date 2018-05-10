<%@ Page Title="My Reservations" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="MakeReservation.aspx.cs" Inherits="MiSAv3.Client.MakeReservation" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <br />
        <div class="row">
            <div class="col-12">
                <asp:GridView ID="CurrentReservations" runat="server" CssClass="table table-striped table-bordered table-responsive" 
                    AutoGenerateColumns="false" OnDataBound="CurrentReservations_DataBound">
                    <Columns>
                        <asp:BoundField DataField="eventstart" HeaderText="Start" />
                        <asp:BoundField DataField="eventend" HeaderText="End" />
                        <asp:BoundField DataField="ExperimentID" HeaderText="ExpID" Visible="false"/>
                        <asp:TemplateField>
                            <ItemTemplate>
                                    <asp:LinkButton ID="Startlink" runat="server" CommandArgument='<%# Eval("eventstart") %>'
                                        OnClick="Startlink_Click">Reserve</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="offset-2 col-sm-2">
                <asp:HyperLink ID="NewReservation" NavigateUrl="~/Reservation/Reserve.aspx" Visible="false" runat="server" Text="New Reservation"/>
                <asp:Button ID="Launch" runat="server" Text="Launch Lab" OnClick="Launch_Click" Visible="false" CssClass="btn btn-success"/>
                <asp:TextBox ID="LinkTextBox" runat="server" Visible="false"/>
                <asp:TextBox ID="expID" runat="server" Visible="false"/>
                <asp:TextBox ID="Time" runat="server"/>
                <asp:TextBox ID="Time1" runat="server"/>
            </div>
        </div>
    </div>
    

</asp:Content>
