<%@ Page Title="My Reservations" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true" CodeBehind="MakeReservation.aspx.cs" Inherits="MiSAv3.Client.ClientReservations" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
        <br />
        <div class="row">
            <div class="col-12">
                <asp:GridView ID="CurrentReservations" runat="server" CssClass="table table-striped table-bordered table-responsive" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="eventstart" HeaderText="Start" />
                            <asp:BoundField DataField="eventend" HeaderText="End" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="Launch" runat="server" >Launch</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
