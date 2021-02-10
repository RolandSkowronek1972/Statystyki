<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oglp.aspx.cs" Inherits="Statystyki_2018.oglp" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" %>

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

            .horizont {
                transform: translate(-25mm, 0) scale(0.80);
                -webkit-transform: translate(-25mm, 0) scale(0.80);
                -moz-transform: translate(-25mm, 0) scale(0.80);
            }
        }
    </style>

    <script src="Scripts/rls.js"></script>

    <div class="noprint" id="menu" style="background-color: #f7f7f7; z-index: 9999">
        <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position: relative; width: 1050px; left: 0px;">
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
                        <input id="Button1" class="ax_box print fa fa-print" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>

                    <td style="width: auto; padding-left: 5px;">
                        <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">

        <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto; z-index: 10;">
            <asp:Label ID="Label3" runat="server" Text="" Style="font-weight: 700"></asp:Label>
            <br />
        </div>

        <div id="zalatwienia" class="horizont">
            <br />

            &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 1+100 \/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1" AutoGenerateColumns="False" Width="100%" ShowHeader="False" OnRowDataBound="gwTabela1_RowDataBound">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_40" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_40" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_40" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_40" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_40" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_40" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
        </div>

        <div class="horizont page-break">
            &nbsp;<asp:Label ID="Label12" runat="server" Text="Wydajnośc sędziów orzekających w Wydziale  IV Pracy"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label2" runat="server" Text="tabela  2" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela2" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label47" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label48" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_gwTabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_gwTabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_gwTabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_gwTabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_gwTabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <div class="horizont page-break">
            &nbsp;<asp:Label ID="Label14" runat="server" Text="Wskaźnik odroczeń (liczba spraw odroczonych przez liczbę spraw wyznaczonych na rozprawę)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel3" runat="server" Text="tabela  3" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela3" runat="server" OnRowCreated="naglowekTabeli_gwTabela3" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela3" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>

                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label47" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label48" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_gwTabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <div class="horizont page-break">
            &nbsp;<asp:Label ID="Label7" runat="server" Text="Wielokrotna (należy podzielić pozostałość na koniec okresu kontrolnego przez średni miesięczny wpływ)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel4" runat="server" Text="tabela 4" Visible="False"></asp:Label>
            <br />
            <div id="TABELA5" class="page-break">
                <table style="width: 100%;">
                    <tr>
                        <td class="borderAll center">&nbsp;</td>
                        <td class="borderAll center">pozostałość na koniec okresu kontrolnego </td>
                        <td class="borderAll center">średni wpływ</td>
                        <td class="borderAll center">wielokrotna</td>
                    </tr>
                    <tr>
                        <td class="col_120 borderAll">P</td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!4!1!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!4!2!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!4!3!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_120 borderAll">Np.</td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!4!1!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!4!2!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!4!3!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_120 borderAll">Po</td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!4!1!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!4!2!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!4!3!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_120 borderAll gray">Razem</td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!4!1!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!4!2!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_250">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!4!3!3')">
                                <asp:Label CssClass="normal" ID="tab_4_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                </table>

                <br />
            </div>

            <div class="page-break">
                &nbsp;<asp:Label ID="Label6" runat="server" Text="Ilość  odroczonych spraw &quot;P&quot; przez sedziów orzekających  w Wydziale IV Pracy"></asp:Label>
                &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel5" runat="server" Text="tabela 5" Visible="False"></asp:Label>
                <br />

                <asp:GridView ID="gwTabela5" runat="server" OnRowCreated="naglowekTabeli_gwTabela5" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela5" Width="100%" ShowHeader="False" ShowFooter="True">
                    <Columns>

                        <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label51" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                <asp:Label ID="Label52" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                    <asp:Label ID="Label_gwTabela13138" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_120" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                    <asp:Label ID="Label_gwTabela13139" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_120" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle CssClass="gray" />
                </asp:GridView>

                <br />
            </div>
            <div class="page-break">
                &nbsp;<asp:Label ID="Label10" runat="server" Text="Ilość  spraw  z zakresu prawa pracy, w których postępowanie toczy się powyżej 1 roku"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel6" runat="server" Text="tabela 6  \/\/\/" Visible="False"></asp:Label>
                &nbsp;<br />

                <asp:GridView ID="gwTabela6" runat="server" OnRowCreated="naglowekTabeli_gwTabela6" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela6" Width="100%" ShowHeader="False" ShowFooter="True">
                    <Columns>

                        <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label53" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                <asp:Label ID="Label54" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                    <asp:Label ID="Label_gwTabela13161" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                    <asp:Label ID="Label_gwTabela13162" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                    <asp:Label ID="Label_gwTabela13163" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                    <asp:Label ID="Label_gwTabela13164" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                    <asp:Label ID="Label_gwTabela13165" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                    <asp:Label ID="Label_gwTabela13166" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                    <asp:Label ID="Label_gwTabela13166" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                    <asp:Label ID="Label_gwTabela13168" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                    <asp:Label ID="Label_gwTabela13169" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                    <asp:Label ID="Label_gwTabela13170" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 " />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                    <asp:Label ID="Label_gwTabela13171" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 " />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                    <asp:Label ID="Label_gwTabela13172" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="col_60 gray" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle CssClass="gray" />
                </asp:GridView>

                <br />
            </div>
            <div class="page-break">
                &nbsp;<asp:Label ID="Label5" runat="server" Text="Stan referatów"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel7" runat="server" Text="tabela 7  \/\/\/" Visible="False"></asp:Label>
                &nbsp;<br />

                <asp:GridView ID="GwTabela7" runat="server" OnRowCreated="naglowekTabeli_GwTabela7" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_GwTabela7" Width="100%" ShowHeader="False" ShowFooter="True">
                    <Columns>

                        <asp:TemplateField HeaderText="imie" SortExpression="imie">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="t2_nazwisko" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                    <asp:Label ID="Label_GwTabela7101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="center borderAll" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                    <asp:Label ID="Label_GwTabela7102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="center borderAll" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                    <asp:Label ID="Label_GwTabela7103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="center borderAll" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                            <ItemTemplate>
                                <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                    <asp:Label ID="Label_GwTabela7104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                </a>
                            </ItemTemplate>
                            <ItemStyle CssClass="center borderAll" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle CssClass="gray" />
                </asp:GridView>
            </div>
            <div class="page-break">
                &nbsp;<br />
                <asp:Label ID="Label9" runat="server" Text="Sprawy zawieszone "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel8" runat="server" Text="tabela 8  \/\/\/" Visible="False"></asp:Label>
                &nbsp;<br />
                <div id="TABELA5" class="page-break">
                    <table style="width: 100%;">
                        <tr>
                            <td class="borderAll  center">&nbsp;</td>
                            <td class="borderAll  center">Liczba spraw</td>
                            <td class="borderAll  center">terminy czynności nadzorczych</td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 174 § 1 pkt 1 k.p.c</td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=1!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=1!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 174 § 1 pkt 2 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=2!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=2!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 174 § 1 pkt 3 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=3!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=3!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 174 § 1 pkt 4 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=4!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=4!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 177 § 1 pkt 1 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=5!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=5!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 177 § 1 pkt 2 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=6!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=6!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 177 § 1 pkt 3 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=7!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=7!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 177 § 1 pkt 4 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=8!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=8!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 177 § 1 pkt 5 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=9!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=9!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 177 § 1 pkt 6 k.p.c </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=10!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=10!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class=" borderAll wciecie">art. 174 § 1 </td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=11!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="col_250 borderAll">
                                <a href="javascript: openPopup('popup.aspx?sesja=11!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                        <tr>
                            <td class="borderAll gray center">Razem</td>
                            <td class="borderAll gray center">
                                <a href="javascript: openPopup('popup.aspx?sesja=12!8!1!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                            <td class="borderAll gray center">
                                <a href="javascript: openPopup('popup.aspx?sesja=12!8!2!3')">
                                    <asp:Label CssClass="normal" ID="tab_8_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                        </tr>
                    </table>
                </div>
                <div class="page-break">
                    &nbsp;<br />
                    <asp:Label ID="Label8" runat="server" Text="Terminowość sporządzania uzasadnień sędziów w Wydziale IV Pracy"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel9" runat="server" Text="tabela 9  \/\/\/" Visible="False"></asp:Label>
                    &nbsp;<br />
                    <div id="TABELA5" class="page-break">
                        <table style="width: 100%;">
                            <tr>
                                <td class="borderAll center" colspan="11">Postępowanie międzyinstancyjne w zakresie spraw P</td>
                            </tr>
                            <tr>
                                <td class="borderAll center" colspan="11">Ilośc spraw przedstawionych II instancji (od daty wydania orzeczenia)</td>
                            </tr>
                            <tr>
                                <td class="borderAll center" rowspan="3">Ogółem&nbsp;
                                </td>
                                <td class="borderAll center" colspan="2">do 2 miesięcy</td>
                                <td class="borderAll center" colspan="2">od 2 do 3 miesięcy
                                </td>
                                <td class="borderAll center" colspan="2">od 3 do 6 miesięcy
                                </td>
                                <td class="borderAll center" colspan="2">od 6 do 9 miesięcy
                                </td>
                                <td class="borderAll center" colspan="2">ponad 9 miesięcy
                                </td>
                            </tr>
                            <tr>
                                <td class="borderAll center">ogółem</td>
                                <td class="borderAll center">%</td>
                                <td class="borderAll center">ogółem</td>
                                <td class="borderAll center">%</td>
                                <td class="borderAll center">ogółem</td>
                                <td class="borderAll center">%</td>
                                <td class="borderAll center">ogółem</td>
                                <td class="borderAll center">%</td>
                                <td class="borderAll center">ogółem</td>
                                <td class="borderAll center">%</td>
                            </tr>
                            <tr>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!4!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!5!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!6!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!7!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!8!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!9!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_120 borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!9!10!3')">
                                        <asp:Label CssClass="normal" ID="tab_9_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                        </table>

                        <br />
                    </div>
                    <div class="page-break">
                        &nbsp;<asp:Label ID="Label13" runat="server" Text="Statystyczna"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel10" runat="server" Text="tabela 10  \/\/\/" Visible="False"></asp:Label>
                        &nbsp;<br />
                        <asp:GridView ID="GwTable10" runat="server" OnRowCreated="naglowekTabeli_GwTable10" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_GwTable10" Width="100%" ShowHeader="False" ShowFooter="True">
                            <Columns>
                                <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                    <ItemTemplate>
                                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="t2_nazwisko" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                            <asp:Label ID="Label_GwTable10101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                            <asp:Label ID="Label_GwTable10102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                            <asp:Label ID="Label_GwTable10103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                            <asp:Label ID="Label_GwTable10104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                            <asp:Label ID="Label_GwTable10105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                            <asp:Label ID="Label_GwTable10106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                            <asp:Label ID="Label_GwTable10107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                            <asp:Label ID="Label_GwTable10108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                            <asp:Label ID="Label_GwTable10109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                                    <ItemTemplate>
                                        <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                            <asp:Label ID="Label_GwTable10110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="col_60" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle CssClass="gray" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div id="debag">
            <br />
            <br />
            Raport statystyczny
                     <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label11" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>