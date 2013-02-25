﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="LoggedExercise_default" %>

<%@ Register Src="~/ui/uc/ucViewExercise.ascx" TagPrefix="uc1" TagName="ucViewExercise" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <uc1:ucViewExercise runat="server" ID="ucViewExercise" />
    <hr />
    <table>
        <tr>
            <td>
                <asp:ListBox ID="exerciseSet" runat="server"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td>Set number: 
            </td>
            <td>
                <asp:Label ID="set" runat="server" Text="1"></asp:Label></td>
        </tr>
        <tr>
            <td>Weight: 
            </td>
            <td>
                <asp:TextBox ID="weight" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Distance:
                
            </td>
            <td>
                <asp:TextBox ID="distance" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Time:
                
            </td>
            <td>
                <asp:TextBox ID="time" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Rep:
            </td>
            <td>
                <asp:TextBox ID="rep" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="recordSet" runat="server" Text="Add Set" /></td>
            <td>
                <asp:Button ID="saveAll" runat="server" Text="Save" /></td>
        </tr>

    </table>
</asp:Content>
