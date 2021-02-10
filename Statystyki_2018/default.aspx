<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Statystyki_2018._default" EnableEventValidation="false" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>STATYSTYKI LOGOWANIE</title>
    <link href="style/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <br />
            <br />
            <div class="accountInfo" style="left: 0px; top: 1px">
                <div style="color: #000; background: 0; padding-bottom: 14px; font-size: 24px; border-bottom: 1px solid #e6e6e6; margin-bottom: 15px; height: 18px;">
                    Zaloguj się
                </div>

                <br />
                <div style="padding: 24px 24px 15px 15px">
                    <div style="height: 28px;">
                        <div style="width: 140px; float: left;">
                            <asp:Label ID="Label1" runat="server" Text=" Użytkownik"></asp:Label>
                        </div>
                        <div style="width: 160px; float: right">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                    <div style="height: 28px;">
                        <div style="width: 140px; float: left;">
                            <asp:Label ID="Label4" runat="server" Text="Domena:" Visible="False"></asp:Label>
                        </div>
                        <div style="width: 160px; float: right">
                            <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                    <div style="height: 28px;">
                        <div style="width: 140px; float: left;">
                            <asp:Label ID="Label2" runat="server" Text=" Hasło"></asp:Label>
                        </div>
                        <div style="width: 160px; float: right">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                            <br />
                        </div>
                        <br />
                        <br />
                    </div>
                </div>

                <div class="OK_login" style="text-align: center;">

                    <asp:LinkButton ID="LinkButton1" runat="server" Width="200px" Height="30px"
                        CssClass="button_" OnClick="LinkButton1_Click">Zaloguj!</asp:LinkButton>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="TextBox2" ErrorMessage="Hasło jest wymagane"></asp:RequiredFieldValidator>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="TextBox1" ErrorMessage="Proszę wpisać użytkownika"></asp:RequiredFieldValidator>

                    <br />

                    <br />
                    <asp:TextBox ID="ErrorBox" runat="server" Height="164px" TextMode="MultiLine" Visible="False" Width="357px"></asp:TextBox>
                    <br />
                </div>
            </div>
        </div>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <div style="margin-left: auto; margin-right: auto; top: 40%;">
            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" CloseOnEscape="True" HeaderText="Bład logowania" Modal="True" Theme="Moderno">
                <ClientSideEvents Shown="function(s, e) {
var left = 350;
    var top = 350;
    popup.ShowAtPos(left, top);

} " />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">Błędnie podany użytkownik lub hasło!<br />
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
    </form>
</body>
</html>