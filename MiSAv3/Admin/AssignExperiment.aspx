<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AssignExperiment.aspx.cs" Inherits="MiSAv3.Admin.AssignExperiment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <style>
        .danger {
            text-decoration-color: red;
        }
    </style>
    <asp:Panel ID="AssignmentDetailsPanel" runat="server" Visible="false">
        <div class="container">
            <div class="row form-group">
                <div class="col-sm-5">
                    <asp:HiddenField ID="hfAssignmentID" runat="server" />
                </div>
            </div>
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="ExperimentIDTextBox" Text="ExperimentID" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox runat="server" ID="ExperimentIDTextBox" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ExperimentIDTextBox"
                        CssClass="text-danger" ErrorMessage="ExperimentID is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="UniversityTextBox" Text="University" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox runat="server" ID="UniversityTextBox" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UniversityTextBox"
                        CssClass="text-danger" ErrorMessage="University is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="CourseTextBox" Text="Course" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox runat="server" ID="CourseTextBox" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CourseTextBox"
                        CssClass="text-danger" ErrorMessage="Course is required." />
                </div>
            </div>
            <div class="row form-group">
                <div class="offset-2 col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="YearTextBox" Text="Year" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox runat="server" ID="YearTextBox" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="YearTextBox"
                        CssClass="text-danger" ErrorMessage="Year is required." />
                </div>
            </div>
            <div class="row">
                <div class="offset-2 col-sm-2">
                    <asp:Label runat="server" AssociatedControlID="CourseUnitTextBox" Text="Course Unit" />
                </div>
                <div class="col-sm-4">
                    <asp:TextBox runat="server" ID="CourseUnitTextBox" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="CourseUnitTextBox"
                        CssClass="text-danger" ErrorMessage="CourseUnit is required." />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="offset-4 col-sm-2">
                    <asp:Button ID="AssignButton" runat="server" Text="Assign" CssClass="btn btn-block btn-info" OnClick="AssignButton_Click" />
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="AssignmentsGridView" runat="server">
        <div class="container">
            <br />
            <div class="row">
                <div class="col-sm-12">
                    <asp:GridView ID="gv" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="AssignmentID" HeaderText="ID" />
                            <asp:BoundField DataField="University" HeaderText="University" />
                            <asp:BoundField DataField="Course" HeaderText="Course" />
                            <asp:BoundField DataField="YearOfStudy" HeaderText="Year" />
                            <asp:BoundField DataField="CourseUnit" HeaderText="CourseUnit" />
                            <asp:BoundField DataField="ExperimentID" HeaderText="ExperimentID" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditlnkView" runat="server" CommandArgument='<%# Eval("AssignmentID") %>'
                                        OnClick="EditlnkView_Click">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="DeletelnkView" runat="server" CommandArgument='<%# Eval("AssignmentID") %>'
                                        OnClick="DeletelnkView_Click" CssClass="danger">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="off-2 col-sm-2">
                    <asp:Button ID="NewAssignmentButton" runat="server" Text="New Assignment" OnClick="NewAssignmentButton_Click" 
                        CssClass="btn btn-primary"/>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
