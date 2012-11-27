<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="Default" %>

<%@ Register Src="~/ui/uc/AddNewExercise.ascx" TagName="addExercise" TagPrefix="uc1" %>
<%@ Register src="~/ui/uc/ucDeleteExercise.ascx" tagname="ucDeleteExercise" tagprefix="uc2" %>
<%@ Register src="~/ui/uc/ucEnableExercise.ascx" tagname="ucEnableExercise" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <h3>Manage System Exercises</h3>
    <h4>Add system exercises</h4>
    <uc1:addExercise ID="courses" runat="server" />
    <h4>Delete system exercise</h4>
    <uc2:ucDeleteExercise ID="ucDeleteExercise" runat="server" />
    <h4>Disable system exercise</h4>
        <uc2:ucEnableExercise ID="ucEnableExercise" runat="server" />
    <h4>Modify system exercise</h4>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="getAllExercises" TypeName="Layer2Manager"></asp:ObjectDataSource>
        <asp:DropDownList ID="ddlExercises" runat="server" 
            onselectedindexchanged="ddlExercises_SelectedIndexChanged" 
            DataSourceID="ObjectDataSource1" DataTextField="name" DataValueField="id" Visible="False">
        </asp:DropDownList>
        </div>
</asp:Content>

