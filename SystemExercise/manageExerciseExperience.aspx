﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true"
    CodeFile="manageExerciseExperience.aspx.cs" Inherits="systemExercise_manageExerciseExperience" %>

<%@ Register Src="~/ui/uc/ucViewExercise.ascx" TagName="viewExercise" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2
        {
            width: 296px;
        }
        .style9
        {
            width: 175px;
        }
        .style10
        {
            width: 700px;
        }
        .style11
        {
            width: 250px;
        }
        .style12
        {
            width: 255px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <hr />
    <div style="width: 50%; margin: 0px auto 0px auto">
        <asp:Button ID="mngExerciseExpBtn" runat="server" Text="Manage Exercise Experience"
            CssClass="button" OnClick="mngExerciseExpBtn_Click" />
        <asp:Button ID="mngUserExpBtn" runat="server" Text="Manage User Experience" CssClass="button"
            OnClick="mngUserExpBtn_Click" />
    </div>
    <br />
    <div>
        <asp:MultiView ID="functionalityMultiView" runat="server">
            <asp:View ID="exerciseExpView" runat="server">
                <uc1:viewExercise ID="viewExerciseExp" runat="server" />
                <hr />
                <asp:MultiView ID="manageExperienceMultiView" runat="server">
                    <asp:View ID="emptyView" runat="server">
                    </asp:View>
                    <asp:View ID="modifyExperienceView" runat="server">
                        <h4>
                            Modify Exercise Experience</h4>
                        <div>
                            <table>
                                <tr>
                                    <td class="style11">
                                        Base Experience Value:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="baseTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="baseTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="modifyExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="baseTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="modifyExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        Time Modifier:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="timeTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="timeTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="modifyExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="timeTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="modifyExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        Weight Modifier:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="weightTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="weightTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="modifyExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="weightTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="modifyExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        Rep Modifier:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="repTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="repTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="modifyExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="repTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="modifyExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        Distance Modifier:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="distanceTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="distanceTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="modifyExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="distanceTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="modifyExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Button ID="saveExpBtn" runat="server" Text="Save" OnClick="saveExpBtn_Click"
                                ValidationGroup="modifyExperience" />
                            <asp:Label ID="saveResultLbl" runat="server" Text=""></asp:Label>
                        </div>
                    </asp:View>
                    <asp:View ID="setNewExperienceView" runat="server">
                        <h4>
                            Set Exercise Experience</h4>
                        <asp:Label ID="noExpLbl" runat="server" Text="This exercise does not have any experience values associated with it yet.  Fill in the fields below to add an experience reward fomrula to it."></asp:Label>
                        <br />
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td class="style11">
                                        Base Experience Value:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="addBaseTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="addBaseTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="addExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="addBaseTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="addExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        Time Modifier:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="addTimeTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="addTimeTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="addExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="addTimeTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="addExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        Weight Modifier:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="addWeightTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="addWeightTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="addExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="addWeightTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="addExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        Rep Modifier:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="addRepTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="addRepTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="addExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="addRepTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="addExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style11">
                                        Distance Modifier:
                                    </td>
                                    <td class="style9">
                                        <asp:TextBox ID="addDistanceTxtBox" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="style10">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                            ErrorMessage="*Entered values must be a double or int (up to 3 decimal places)"
                                            ControlToValidate="addDistanceTxtBox" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]+([\.][0-9]{1,3})?$"
                                            ValidationGroup="addExperience"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*Required"
                                            ControlToValidate="addDistanceTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="addExperience"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Button ID="addExpBtn" runat="server" Text="Save" OnClick="addExpBtn_Click" ValidationGroup="addExperience" />
                            <asp:Label ID="addResultLbl" runat="server" Text=""></asp:Label>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </asp:View>
            <asp:View ID="userExpView" runat="server">
                <div>
                    <h4>
                        Modify Inactive User Experience Point Atrophy</h4>
                    <table>
                        <tr>
                            <td class="style12">
                                Days Allowed Inactive:
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="inactiveTimeTxtBox" runat="server"></asp:TextBox>
                            </td>
                            <td class="style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*Required"
                                    ControlToValidate="inactiveTimeTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="expAtrophy"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                                    ErrorMessage="*Must be a whole number less than 100" ControlToValidate="inactiveTimeTxtBox"
                                    Display="Dynamic" ForeColor="Red" ValidationGroup="expAtrophy" ValidationExpression="[0-9]{1,2}"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style12">
                                Experience Loss Per Day:
                            </td>
                            <td class="style9">
                                <asp:TextBox ID="expLossTxtBox" runat="server"></asp:TextBox>
                            </td>
                            <td class="style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*Required"
                                    ControlToValidate="expLossTxtBox" Display="Dynamic" ForeColor="Red" ValidationGroup="expAtrophy"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                    ErrorMessage="*Must be a whole number" ControlToValidate="expLossTxtBox" Display="Dynamic"
                                    ForeColor="Red" ValidationGroup="expAtrophy" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="saveAtrophyBtn" runat="server" Text="Save" OnClick="saveAtrophyBtn_Click"
                        ValidationGroup="expAtrophy" />
                    <asp:Label ID="saveAtrophyResultLbl" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <hr />
                <div>
                    <h4>
                        Modify Required Experience For Leveling Up</h4>



                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>