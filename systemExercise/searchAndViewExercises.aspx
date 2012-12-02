﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true"
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
            AutoPostBack="False" ValidationGroup="Search" />
        <juice:Autocomplete ID="exerciseAutoComplete" runat="server" TargetControlID="exerciseSearchBox" />
        <asp:Button ID="exerciseSearchButton" runat="server" Text="Search" 
            OnClick="exerciseSearchButton_Click" ValidationGroup="Search" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="exerciseSearchBox" ErrorMessage="No symbols" ForeColor="Red" 
            ValidationExpression="^[a-zA-Z0-9 ]+$" Display="Dynamic" 
            ValidationGroup="Search"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="exerciseSearchBox" Display="Dynamic" 
            ErrorMessage="Need a name" ForeColor="Red" ValidationGroup="Search"></asp:RequiredFieldValidator>
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
    <div>
    <asp:RadioButtonList ID="rblEnaber" runat="server" AutoPostBack="True" 
        onselectedindexchanged="rblEnaber_SelectedIndexChanged" TextAlign="Left">
        <asp:ListItem Value="1">Enabled</asp:ListItem>
        <asp:ListItem Value="0">Disabled</asp:ListItem>
    </asp:RadioButtonList>

    </div>
    <asp:Panel ID="Panel1" runat="server">
            <div>
                <table id="newExerciseForm">
                    <tr>
                        <td>
                            <p>
                                Muscle Groups:</p>
                        </td>
                        <td>
                            <asp:CheckBoxList ID="cblMuscleGroups" runat="server" RepeatDirection="Horizontal"
                                CssClass="cblStyle">
                                <asp:ListItem>Chest</asp:ListItem>
                                <asp:ListItem>Back</asp:ListItem>
                                <asp:ListItem>Shoulder</asp:ListItem>
                                <asp:ListItem>Arms</asp:ListItem>
                                <asp:ListItem>Legs</asp:ListItem>
                                <asp:ListItem>Cardio</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                        <td class="style1">
                            <asp:CustomValidator runat="server" ID="cvmodulelist" ClientValidationFunction="ValidateModuleList"
                                ErrorMessage="*Please select at least one muscle group" ValidationGroup="AddExercise"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Exercise Name:</p>
                        </td>
                        <td>
                            <asp:TextBox ID="tbExerciseName" runat="server" class="tbStyle"></asp:TextBox>
                        </td>
                        <td class="style1">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Exercise name required"
                                ControlToValidate="tbExerciseName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
                                ValidationGroup="AddExercise"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Exercise Attributes:
                            </p>
                        </td>
                        <td>
                            <asp:CheckBoxList ID="cblAttributes" runat="server" CssClass="cblStyle" RepeatDirection="Horizontal">
                                <asp:ListItem>Rep</asp:ListItem>
                                <asp:ListItem>Weight</asp:ListItem>
                                <asp:ListItem>Distance</asp:ListItem>
                                <asp:ListItem>Time</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                        <td class="style1">
                            <%--            <asp:CustomValidator runat="server" ID="CustomValidator1"
  ClientValidationFunction="ValidateModuleList"
  ErrorMessage="*Please select at least one attribute" ValidationGroup="AddExercise"></asp:CustomValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Equipment:</p>
                        </td>
                        <td>
                            <asp:TextBox ID="tbEquipment" runat="server" Height="144px" CssClass="tbStyle" TextMode="MultiLine"></asp:TextBox>
                            <%--                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="tbEquipment" ErrorMessage="*Please enter a proper name" 
                    ValidationExpression="^[A-Za-z]{1,}$" ForeColor="Red" 
                    ValidationGroup="AddExercise"></asp:RegularExpressionValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>
                                Video Link:
                            </p>
                        </td>
                        <td>
                            <asp:TextBox ID="tbVideoLink" runat="server" CssClass="tbStyle"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnConfirmChanges" runat="server" 
                                onclick="btnConfirmChanges_Click" Text="CONFIRM" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="lblResult" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnDeleteExercise" runat="server" Text="Delete Exercise" 
        OnClientClick="return confirm('Doing this will irreversibly remove the exercise from the system. Are you sure?');" OnClick="btnDeleteExercise_Click" />
                <asp:Label ID="lblDeletionResult" runat="server"></asp:Label>
            </div>
    </div>
    </asp:Panel>
</asp:Content>
