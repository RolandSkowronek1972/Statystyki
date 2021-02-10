<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aktpe.aspx.cs" Inherits="Statystyki_2018.aktpe" %>

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

        <div id="TABELA1" >
            <br />
            <asp:Label ID="lbTabela1" runat="server"></asp:Label>

            <asp:Label ID="infoLabel1" runat="server" Text="     Tabela 1 \/" Visible="False"></asp:Label>
            <asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela1" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label_gwTabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label ID="Label_gwTabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label ID="Label_gwTabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_45 gray" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>
        </div>

        <div id="tabela3" class="page-break">
            <br />
            <asp:Label ID="lbTabela2" runat="server"></asp:Label>
            <asp:Label ID="infoLabel2" runat="server" Text=" Tabela 2 \/" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela2"  ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!2"%>')">
                                <asp:Label ID="Label_gwTabela3101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_71" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela3102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_71" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela3103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_71" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela3104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_71" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela3105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_71 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela3106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_71 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela3107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_71" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela3108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_71" />
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
            <table >
                <tr>
                    <td class="borderAll wciecie" colspan="2">Kategorie spraw:
                    </td>
                    <td class="borderAll center">Kow</td>
                    <td class="borderAll center">Pen</td>
                    <td class="col_90 center borderAll gray">Razem</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Pozostało z okresu poprzedniego</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Wpływ spraw</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Załatwienia</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie" colspan="2">Pozostało na okres następny:</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll" rowspan="7">Zaległości</td>
                    <td class="wciecie borderAll">Pow. 3 – 6 m-cy</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow. 6-12 m-cy</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.12m-cy do 2 lat</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.6-12 m-cy</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=8!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.3 do 5 lat</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=9!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Pow.5 do 8 lat</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=10!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll">Ponad 8 lat</td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!1!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 borderAll center">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!2!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_90 center borderAll gray">
                        <a href="javascript: openPopup('popup.aspx?sesja=11!3!3!3')">
                            <asp:Label CssClass="normal" ID="tab_3_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
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