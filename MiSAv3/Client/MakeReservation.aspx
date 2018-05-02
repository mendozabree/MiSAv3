<%@ Page Title="My Reservations" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="MakeReservation.aspx.cs" Inherits="MiSAv3.Client.MakeReservation" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <br />
        <div class="row">
            <div class="col-12">
                <asp:GridView ID="CurrentReservations" runat="server" CssClass="table table-striped table-bordered table-responsive" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="eventstart" HeaderText="Start" />
                        <asp:BoundField DataField="eventend" HeaderText="End" />
                        <asp:BoundField DataField="ExperimentID" HeaderText="ExpID" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Launch" runat="server"  Text="Launch" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <asp:GridView ID="Link" runat="server" CssClass="table table-striped table-bordered table-responsive" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="LabLink" HeaderText="Link" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Launch" runat="server" CommandArgument='<%# Eval("LabLink") %>' Text="Launch" OnClick="Launch_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="offset-2 col-sm-2">
                <a class="nav-link" href="../Test/Tut.aspx">New Reservation</a>
                <asp:TextBox ID="expID" runat="server"/>
                <asp:TextBox ID="LinkTextBox" runat="server" />
            </div>
        </div>
    </div>
    

</asp:Content>
