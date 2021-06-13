<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aktk2.aspx.cs" Inherits="Statystyki_2018.aktk2" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #menu {
            position: relative;
        }

            #menu.scrolling {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
            }

        @media print {
            @page {
                size: 29cm 21.7cm;
                margin: 5mm 5mm 5mm 5mm; /* change the margins as you want them to be. */
            }

            .horizont {
                transform: translate(-35mm, 0) scale(0.75);
                -webkit-transform: translate(-35mm, 0) scale(0.75);
                -moz-transform: translate(-35mm, 0) scale(0.75);
            }
        }
    </style>

    <script src="Scripts/rls.js"></script>

    <div id="menu" class="manu_back noprint" style="height: 40px;">

        <table>
            <tr>
                <td style="width: auto; padding-left: 5px;">
                    <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                </td>
                <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: auto; padding-left: 5px;">

                    <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
                </td>
                <td style="width: auto; padding-left: 5px;">
                    <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px; z-index: 11;">

        <div id="tabela1" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label6" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
        </div>

        <div id="zalatwienia2" class="horizont">
            <br />
            <asp:Label ID="lbTabela1" runat="server"></asp:Label>

            <asp:Label ID="infoLabel1" runat="server" Text="     Tabela 1 \/" Visible="False"></asp:Label>
            <asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela1" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_200F" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label_gwTabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label ID="Label_gwTabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label ID="Label_gwTabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label ID="Label_gwTabela1113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                <asp:Label ID="Label_gwTabela1114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                <asp:Label ID="Label_gwTabela1115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_16" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                                <asp:Label ID="Label_gwTabela1116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_17" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')">
                                <asp:Label ID="Label_gwTabela1117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_18" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')">
                                <asp:Label ID="Label_gwTabela1118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_19" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')">
                                <asp:Label ID="Label_gwTabela1119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_20" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!2"%>')">
                                <asp:Label ID="Label_gwTabela1120" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_21" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!2"%>')">
                                <asp:Label ID="Label_gwTabela1121" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_22" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!2"%>')">
                                <asp:Label ID="Label_gwTabela1122" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_23" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!2"%>')">
                                <asp:Label ID="Label_gwTabela1123" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_24" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!2"%>')">
                                <asp:Label ID="Label_gwTabela1124" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_50H gray" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>
        </div>

        <div id="tabela2" class="page-break">
            <br />
            <asp:Label ID="lbTabela2" runat="server"></asp:Label>
            <asp:Label ID="infoLabel2" runat="server" Text="            Tabela 2 \/" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela2" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_200F" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela3101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela3102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela3103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela3104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela3105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela3106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela3107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela3108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela3109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label_gwTabela3110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label ID="Label_gwTabela3111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label ID="Label_gwTabela3112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label ID="Label_gwTabela3113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                <asp:Label ID="Label_gwTabela3114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                <asp:Label ID="Label_gwTabela3115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                                <asp:Label ID="Label_gwTabela3116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')">
                                <asp:Label ID="Label_gwTabela3117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')">
                                <asp:Label ID="Label_gwTabela3118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')">
                                <asp:Label ID="Label_gwTabela3119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <div id="Tabela4" class="page-break">
            &nbsp;<asp:Label ID="lbTabela3" runat="server">Ruch spraw</asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel3" runat="server" Text="Tabela 3 \/" Visible="False"></asp:Label>
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center">Kategorie spraw</td>
                    <td class="borderAll center">Ka</td>
                    <td class="borderAll center">Kz</td>
                    <td class="borderAll center">Kzw</td>
                    <td class="borderAll center">Ko</td>
                    <td class="borderAll center">WSU</td>
                    <td class="borderAll center">Wkk</td>
                    <td class="borderAll center">S</td>
                    <td class="borderAll center">Razem</td>
                </tr>
                <tr>
                    <td class="col_81 borderAll">Pozostało z okresu poprzedniego</td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_81 borderAll">Wpływ spraw</td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_81 borderAll">Załatwienia</td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="col_81 borderAll">Pozostało na okres następny:</td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!4!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!5!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!6!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!7!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_120 borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!8!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>

        <div id="TABELA4" class="page-break">
            <asp:Label ID="lbTabela4" runat="server">Ruch spraw</asp:Label>
            &nbsp;<asp:Label ID="infoLabel4" runat="server" Text="Tabela 4 \/" Visible="False"></asp:Label>
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" colspan="2">Kategorie spraw</td>
                    <td class="borderAll center">Ka</td>
                    <td class="borderAll center">Kz</td>
                    <td class="borderAll center">Kzw</td>
                    <td class="borderAll center">Ko</td>
                    <td class="borderAll center">WSU</td>
                    <td class="borderAll center">WKK</td>
                    <td class="borderAll center">S</td>
                    <td class="borderAll col_90 gray">Razem</td>
                </tr>
                <tr>
                    <td class="col_80_fest borderAll" rowspan="7">Zaległości</td>
                    <td class="wciecie borderAll">Pow.3 – 6 m-cy</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.6-12 m-cy</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.12m-cy do 2 lat</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.2 do 3 lat</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.2 do 3 lat</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.5 do 8 lat</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!6!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Ponad 8 lat</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!5!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!6!3')">
                            <asp:Label CssClass="normal" ID="Label7" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!7!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90 gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!8!3')">
                            <asp:Label CssClass="normal" ID="tab_4_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>
        <div id="debag">
            <br />
            <br />
            Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>