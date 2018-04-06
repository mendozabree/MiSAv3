<%@ Page Title="My Labs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyLabs.aspx.cs" Inherits="MiSAv3.Client.MyLabs" %>

<asp:Content Runat="server" ContentPlaceHolderID="MainContent">
<asp:Panel ID="ViewExperimentsPanel" runat="server">
    <div class="container">
        <br />
        <div class="row">
            <div class="col-12">
                <asp:GridView ID="ExperimentsTable" runat="server" CssClass="table table-striped table-bordered table-responsive" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Programme" HeaderText="Programme" />
                            <asp:BoundField DataField="StudyYear" HeaderText="StudyYear" />
                            <asp:BoundField DataField="CourseUnit" HeaderText="CourseUnit" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="Reserve" runat="server" OnClick="Reserve_Click" href="MyReservation.aspx">Reserve</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            </div>
        </div>
    </div>
</asp:Panel>

    
</asp:Content>