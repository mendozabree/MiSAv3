<%@ Page Title="My Labs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyLabs.aspx.cs" Inherits="MiSAv3.Client.MyLabs" %>

<asp:Content Runat="server" ContentPlaceHolderID="MainContent">
<asp:Panel ID="ViewExperimentsPanel" runat="server">
    <div class="container">
        <br />
        <asp:Panel ID="LabsFilterPanel" runat="server">
            <div class="row form-group">
                <div class="col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="Insititution" Text="University" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="Insititution" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Insititution"
                        CssClass="text-danger" ErrorMessage="Insititution is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="Programme" Text="Course" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="Programme" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Programme"
                        CssClass="text-danger" ErrorMessage="Programme is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="YearOfStudy" Text="Year" />
                </div>
                <div class="col-sm-4">
                    <asp:DropDownList ID="YearOfStudy" runat="server">
                        <asp:ListItem>Select Year</asp:ListItem>
                        <asp:ListItem Value="1" />
                        <asp:ListItem Value="2" />
                        <asp:ListItem Value="3" />
                        <asp:ListItem Value="4" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="YearOfStudy"
                        CssClass="text-danger" ErrorMessage="Year is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="CourseUnitCode" Text="CourseUnit" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox ID="CourseUnitCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CourseUnitCode"
                        CssClass="text-danger" ErrorMessage="CourseUnit is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="offset-2">
                    <asp:Button ID="ViewLabsButton" runat="server" CssClass="btn btn-default btn-block" OnClick="ViewLabsButton_Click" Text="View Labs" />
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="AvailableLabsPanel" runat="server" Visible="false">
            <div class="row">
            <div class="col-12">
                <asp:GridView ID="Experimentsgv" runat="server" CssClass="table table-striped table-bordered table-responsive" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="ExperimentTitle" HeaderText="Title" />
                            <asp:BoundField DataField="ExperimentID" HeaderText="Experiment ID" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="Reserve" runat="server" OnClick="Reserve_Click" href="MyReservation.aspx" Text="Reserve" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
            </div>
        </div>
        </asp:Panel>
    </div>
</asp:Panel>

    
</asp:Content>