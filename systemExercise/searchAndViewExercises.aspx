<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true"
    CodeFile="searchAndViewExercises.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="Server">
        </asp:ScriptManager>
        <label for="_Default">
            Search for an exercise via name:
        </label>
        <asp:TextBox runat="server" ID="exerciseSearchBox" ClientIDMode="Static" 
            AutoPostBack="False" />
        <juice:Autocomplete ID="exerciseAutoComplete" runat="server" TargetControlID="exerciseSearchBox" />
        <asp:Button ID="exerciseSearchButton" runat="server" Text="Search" OnClick="exerciseSearchButton_Click" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="exerciseSearchBox" ErrorMessage="No symbols" ForeColor="Red" 
            ValidationExpression="^[a-zA-Z0-9 ]+$"></asp:RegularExpressionValidator>
        <br />
        Search via muscle groups: 
        <asp:RadioButtonList ID="MuscleGroupRBL" runat="server" 
            onselectedindexchanged="MuscleGroupRBL_SelectedIndexChanged" 
            AutoPostBack="True">
            <asp:ListItem>Chest</asp:ListItem>
            <asp:ListItem>Back</asp:ListItem>
            <asp:ListItem>Shoulders</asp:ListItem>
            <asp:ListItem>Arms</asp:ListItem>
            <asp:ListItem>Legs</asp:ListItem>
            <asp:ListItem>Cardio</asp:ListItem>
        </asp:RadioButtonList>
        <asp:DropDownList ID="ExerciseDDL" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ExerciseDDL_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Label ID="exceriseNotFound" runat="server" ForeColor="Red" 
            Text="No exercise found" Visible="False"></asp:Label>
        <br />
        <table class="style1">
            <tr>
                <td>
                    Exercise Name</td>
                <td>
                    Exercise Equipment</td>
                <td class="style2">
                    Exercise Video</td>
                <td>
                    Exercise Attributes</td>
                <td>
                    Enabled</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="exerciseName" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="exerciseEquipment" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td class="style2">
                    <asp:Label ID="exerciseVideo" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="exerciseAttributes" runat="server" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="exerciseEnabled" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
    </div>
</asp:Content>
