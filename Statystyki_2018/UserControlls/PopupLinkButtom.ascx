<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupLinkButtom.ascx.cs" Inherits="Statystyki_2018.UserControlls.UserControlls_PopupLinkButtom" %>

<link href="../style/popup.css" rel="stylesheet" />

<div class="first ">
    <table style="width: 100%; clear: both;">
        <tr>
            <td align="center">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="normal"></asp:LinkButton>
            </td>
        </tr>
    </table>

    <asp:Panel ID="Panel1" runat="server" Visible="False">

        <div class="popUpNow">
            <table width="100%">
                <tr>
                    <td style="text-align: left;">
                        <asp:Label ID="Label21" runat="server" CssClass="normal" Font-Bold="True" ForeColor="Black"></asp:Label>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label22" runat="server" CssClass="normal" ForeColor="Black"></asp:Label>
                    </td>
                    <td align="right">
                        <asp:LinkButton ID="LinkButton58" runat="server" OnClick="LinkButton58_Click" CssClass="ax_box" Width="60px" Height="16px">Drukuj</asp:LinkButton>
                    </td>
                    <td align="right">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/zamknij.jpg"
                            OnClick="ImageButton1_Click" Height="32px" Width="32px" />
                    </td>
                </tr>
            </table>

            <asp:Panel runat="server" ID="px" Height="390px" ScrollBars="Auto">

                <asp:GridView ID="GridView55" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" GridLines="Horizontal" RowStyle-Height="15px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#656565" Font-Bold="True" ForeColor="#F7F7F7" Height="15px" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </asp:Panel>
        </div>
    </asp:Panel>
</div>

<asp:HiddenField ID="HidField" runat="server" />

<asp:HiddenField ID="HiddenField1" runat="server" />
<asp:HiddenField ID="HiddenField2" runat="server" />
<asp:HiddenField ID="HiddenField3" runat="server" />

<asp:HiddenField ID="HiddenField4" runat="server" />