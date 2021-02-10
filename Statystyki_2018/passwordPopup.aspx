<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="passwordPopup.aspx.cs" Inherits="Statystyki_2018.passwordPopup" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Zmiana hasła</title>
      <style>
          .butn1 {
            background-position: 0% 0%;
            background-image: linear-gradient(to bottom, #F6D014, #D04411) !important;
            -webkit-border-radius: 6px !important;
            -moz-border-radius: 6px !important;
            border-radius: 6px !important;
            line-height: 10px !important;
            color: #FFFFFF !important;
            font-family: Open Sans !important;
            font-size: 20px !important;
            font-weight: 200 !important;
            padding: 13px !important;
            text-shadow: 1px 1px 20px #000000 !important;
            border: solid #FFFFFF 1px !important;
            text-decoration: none !important;
            display: inline-block !important;
            cursor: pointer !important;
            background-color: #F6D014 !important;
            background-repeat: repeat !important;
            background-attachment: scroll !important;
        }

            .butn1:hover {
                background-position: 0% 0%;
                background-image: linear-gradient(to bottom, #F6D014, #F6450F) !important;
                text-decoration: none !important;
                background-color: #F6D014 !important;
                background-repeat: repeat !important;
                background-attachment: scroll !important;
            }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            Użytkownik <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
        </div>
            <table style="width:100%;">
                <tr>
                    <td>Podaj hasło</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Pole musi być wypełnione"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr>
                    <td>Powtórz hasło</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Pole musi być wypełnione"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="Hasło i jego powtórzenie nie sa identyczne"></asp:CompareValidator>
                        <br />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Zapisz" CssClass="butn1" Height="16px" OnClick="zapiszHaslo" />
                        <br />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Anuluj" OnClick="ZamknijOkno" CausesValidation="False" CssClass="butn1" />
                        <br />
                    </td>
                </tr>
            </table>
    </form>
</body>
</html>
