﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="library.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 176px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Title</td>
            <td>
                <asp:Label ID="lblbooktitle" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:Image ID="imgbook" runat="server" Height="100px" Width="100px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblIsBorrowed" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:HiddenField ID="hfbookid" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Borrower</td>
            <td>
                <asp:TextBox ID="txtBorrower" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtBorrower" Display="Dynamic" 
                    ErrorMessage="Enter Borrow's Name"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Mobile</td>
            <td>
                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Enter Mobile No."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtMobile" Display="Dynamic" 
                    ErrorMessage="(e.g: xx-xxx xxx)" SetFocusOnError="True" 
                    ValidationExpression="\d{2}-\d{3} \d{3}"></asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                National Id</td>
            <td>
                <asp:TextBox ID="txtNationalID" runat="server" MaxLength="11"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtNationalID" Display="Dynamic" 
                    ErrorMessage="Enter National ID"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtNationalID" Display="Dynamic" 
                    ErrorMessage="Must be numeric 11 digits" ValidationExpression="\d{11}"></asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Checkout Date</td>
            <td>
                <asp:TextBox ID="txtCheckOutDate" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Return Date</td>
            <td>
                <asp:TextBox ID="txtReturnDate" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnCheckOut" runat="server" onclick="btnCheckOut_Click" 
                    Text="Check-Out" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
