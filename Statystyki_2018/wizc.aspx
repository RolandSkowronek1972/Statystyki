<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="wizc.aspx.cs" Inherits="Statystyki_2018.wizc" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
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
                    <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
                </td>
                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton55" runat="server" class="ax_box" CssClass="ax_box"> Drukuj </asp:LinkButton>
                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell" Visible="False">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 30px;" class="content landscape">

        <div>

            <asp:Label ID="infoLabel01" runat="server" Text="dział 1 \/\/\/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="gray center borderAll" colspan="2">

                        <asp:Label ID="d1Label" runat="server" Text="Dział I"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.1. Podstawa prawna przeprowadzenia wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w01_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.2. Prezes sądu odpowiedzialny za przeprowadzenie wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w02_c01" runat="server" Rows="4" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.3. Wizytowany wydział sądu</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w03_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">1.4. Osoba/osoby przeprowadzająca/e wizytację</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w04_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.5. Termin przeprowadzenia wizytacji</td>
                    <td class="borderAll wciecie">
                        <dx:ASPxDateEdit ID="tab_1_w05_c01" runat="server" Theme="Moderno">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">I.6. Okres objęty wizytacją</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_1_w06_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="page-break">
            &nbsp;<br />
            <asp:Label ID="InfoLabel2" runat="server" Text="dział 2 \/\/\/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll gray center" colspan="2">
                        <asp:Label ID="d1Label0" runat="server" Text="Dział II"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.1. Termin przeprowadzenia poprzedniej wizytacji</td>
                    <td class="borderAll wciecie">
                        <dx:ASPxDateEdit ID="tab_2_w01_c01" runat="server" Theme="Moderno">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.2. Osoba/osoby przeprowadzająca/e poprzednią wizytację</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w02_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">III.3. Okres objęty poprzednia wizytacją </td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w03_c01" runat="server" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.4. Wykonanie zarządzeń nadzorczych wydanych w wyniku przeprowadzenia poprzedniej wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w04_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.5. Czynności nadzorcze podjęte po zakonczeniu poprzedniej wizytacji</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w05_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="col_500 wciecie borderAll">II.6. Wykonanie zarządzeń nadzorczych wydanych w wyniku czynności nadzorczych, o których mowa w II.5.</td>
                    <td class="borderAll wciecie">
                        <asp:TextBox ID="tab_2_w06_c01" runat="server" Rows="4" TextMode="MultiLine" Width="90%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="page-break">
            &nbsp;<br />
            <asp:Label ID="Label1" runat="server" Text="III.1. Sędziowie (wg objaśnień: w zestawieniu należy uwzględnić także sędziów delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="InfoLabel_3_1" runat="server" Text="tabela  3 \/\/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela3" runat="server" OnRowCreated="naglowekTabeli_gwTabela1" AutoGenerateColumns="False" Width="100%" ShowHeader="False" ShowFooter="True" OnRowDataBound="stopkaTabeli1">
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
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
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

        <div class="page-break">
            &nbsp;<br />
            <asp:Label ID="Label3" runat="server" Text="III.2. Referendarze sądowi (wg objaśnień: w zestawieniu należy uwzględnić także referendarzy sądowych delegowanych)"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label6" runat="server" Text="tabela 4  \/\/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela3_2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" Width="100%" ShowHeader="False" ShowFooter="True" OnRowDataBound="stopkaTabeli2">
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
                                <asp:Label ID="Label_gwTabela2101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela2102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela2103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_gwTabela2104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_gwTabela2105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_gwTabela2106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_gwTabela2107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_gwTabela2108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_gwTabela2109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_gwTabela2110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_gwTabela2111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>
            <br />
        </div>
        <div class="page-break">
            &nbsp;<br />
            <asp:Label ID="Label7" runat="server" Text="III.3. Asystenci sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label8" runat="server" Text="tabela 5  \/\/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela3_3" runat="server" OnRowCreated="naglowekTabeli_gwTabela3_3" AutoGenerateColumns="False" Width="100%" ShowHeader="False" ShowFooter="True" OnRowDataBound="stopkaTabeli3">
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
                                <asp:Label ID="Label_gwTabela2101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_gwTabela2102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_gwTabela2103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>
            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label9" runat="server" Text="Dział III.3.2. Obowiązujące w wydziale zasady przydziału pracy asystenom sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Text="tabela 6  \/\/\/" Visible="False"></asp:Label>
            &nbsp;<table style="width: 100%;">
                <tr>
                    <td class="auto-style1">
                        <asp:TextBox ID="tab_6_w01_c01" runat="server" Rows="6" TextMode="MultiLine" Width="99%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Uwagi:</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tab_6_w02_c01" runat="server" Rows="6" TextMode="MultiLine" Width="99%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <br />
        </div>

        <div class="page-break">
            &nbsp;<br />
            <asp:Label ID="Label10" runat="server" Text="Dział III 4.5.6.7 Zmiany limitów i obsad we wszystkich grupach zatrudnienia"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel7" runat="server" Text="tabela 7  \/\/\/" Visible="False"></asp:Label>
            <br />
            &nbsp;<table style="width: 100%;">
                <tr>
                    <td class="center borderAll" rowspan="2">Rok<br />
                    </td>
                    <td class="center borderAll" colspan="3">Sędziowie </td>
                    <td class="center borderAll" colspan="3">referendarze sądowi</td>
                    <td class="center borderAll" colspan="3">referendarze sądowi</td>
                    <td class="center borderAll" colspan="3">urzędnicy sądowi </td>
                    <td class="center borderAll" colspan="2">relacje etatów</td>
                </tr>
                <tr>
                    <td class="center borderAll">liczba sędziów i wakujących stanowisk sędziowskich w ramach limitu w okresie statys-tycznym</td>
                    <td class="center borderAll">*obsada średnio-okresowa </td>
                    <td class="center borderAll">% do limitu</td>
                    <td class="center borderAll">liczba refere-ndarzy w ramach limitu w okresie statysty-cznym</td>
                    <td class="center borderAll">*obsada średnio-okresowa </td>
                    <td class="center borderAll">% do limitu</td>
                    <td class="center borderAll">liczba asystentów w ramach limitu w okresie statysty-cznym</td>
                    <td class="center borderAll">*obsada średnio-okresowa </td>
                    <td class="center borderAll">% do limitu</td>
                    <td class="center borderAll">liczba urzęd-ników w okresie statys-tycznym</td>
                    <td class="center borderAll">*obsada średnio-okresowa </td>
                    <td class="center borderAll">% do limitu</td>
                    <td class="center borderAll">liczba asystentów sędziów przypadająca na jednego sędziego</td>
                    <td class="center borderAll">liczba etatów urzędniczych przypadająca na jeden etat orzeczniczy </td>
                </tr>
                <tr>
                    <td class="center borderAll">
                        <asp:Label ID="tab_7_w01_c01" runat="server" Text=""></asp:Label>
                    </td>

                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!2!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c02" runat="server" Text="0"></asp:Label>
                    </a></td>

                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!3!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!4!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!5!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!6!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!7!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!8!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!9!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!10!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!11!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!12!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!13!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!14!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c14" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=1!7!15!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w01_c15" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td class="center borderAll">
                        <asp:Label ID="tab_7_w02_c01" runat="server" Text="Średnia za okres oceny"></asp:Label>
                    </td>

                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!2!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c02" runat="server" Text="0"></asp:Label>
                    </a></td>

                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!3!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c03" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!4!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c04" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!5!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c05" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!6!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c06" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!7!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c07" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!8!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c08" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!9!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c09" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!10!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c10" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!11!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c11" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!12!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c12" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!13!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c13" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!14!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c14" runat="server" Text="0"></asp:Label>
                    </a></td>
                    <td class="center borderAll col_60"><a href="javascript:openPopup('popup.aspx?sesja=2!7!15!3')">
                        <asp:Label CssClass="normal" ID="tab_7_w02_c15" runat="server" Text="0"></asp:Label>
                    </a></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="borderAll" colspan="8">III.5. Liczba osób wykonujących czynności na innej podstawie niż stosunek pracy, w tym stażyści z urzędów pracy ( podstawa zatrudnienia, okres wykonywania czynności) </td>
                    <td class="borderAll" colspan="7">
                        <asp:TextBox ID="tab_7_w03_c01" runat="server" Rows="6" TextMode="MultiLine" Width="99%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="borderAll" colspan="8">III.6. Warunki pracy (liczba sal rozpraw itp., uwagi) </td>
                    <td class="borderAll" colspan="7">
                        <asp:TextBox ID="tab_7_w04_c01" runat="server" Rows="6" TextMode="MultiLine" Width="99%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="borderAll" colspan="8">III.7. Wnioski </td>
                    <td class="borderAll" colspan="7">
                        <asp:TextBox ID="tab_7_w05_c01" runat="server" Rows="6" TextMode="MultiLine" Width="99%" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <br />
        </div>
        <div class="page-break">
            &nbsp;<br />
            <asp:Label ID="Label13" runat="server" Text="IV.1. Ruch spraw i obciążenie sędziów i referendarzy sądowych w wydziale (ogółem)"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label14" runat="server" Text="tabela 8  \/\/\/" Visible="False"></asp:Label>
            <br />

            <table class="borderAll  center">
                <tr>
                    <td class="center borderAll">kategoria spraw </td>
                    <td class="col_80_fest_fest center borderAll">rok&nbsp; </td>
                    <td class="col_80_fest_fest center borderAll">wpływ</td>
                    <td class="col_80_fest_fest center borderAll">załatwienia</td>
                    <td class="col_80_fest_fest center borderAll">pozostałość</td>
                    <td class="col_80_fest_fest center borderAll">liczba spraw zawie-szonych</td>
                    <td class="col_80_fest_fest center borderAll">wpływ na sędziego / referendarza sądowego według liczby sędziów/ referendarzy i wakujących stanowisk sędziowskich / referen-darskich w ramach limitu</td>
                    <td class="col_80_fest_fest center borderAll">załatwienia na sędziego / referendarza sądowego według liczby sędziów/ referendarzy i wakujących stanowisk sędziowskich / referen-darskich w ramach limitu </td>
                    <td class="col_80_fest_fest center borderAll">pozostałość na sędziego / referendarza sądowego według liczby sędziów/ referendarzy i wakujących stanowisk sędziowskich / referen-darskich w ramach limitu </td>
                    <td class="col_80_fest_fest center borderAll">wpływ na sędziego/<br />
                        referendarza sądowego według obsady średnio-okresowej (w efektywnym czasie pracy) </td>
                    <td class="col_80_fest_fest center borderAll">załatwienia na sędziego/ referendarza sądowego według obsady średnio-okresowej (w efektywnym czasie pracy) </td>
                    <td class="col_80_fest_fest center borderAll">pozostałość na sędziego/<br />
                        referendarza sądowego według obsady średnio-okresowej (w efektywnym czasie pracy) </td>
                    <td class="col_80_fest_fest center borderAll">wskaźnik pozostałości </td>
                </tr>
                <tr>
                    <td class="borderAll ">C</td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!1!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!2!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!3!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!4!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!5!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!6!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!7!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!8!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!9!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!10!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!11!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!8!12!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll ">Cgg</td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!1!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!2!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!3!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!4!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!5!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!6!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!7!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!8!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!9!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!10!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!11!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!8!12!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll ">Co</td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!1!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!2!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!3!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!4!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!5!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!6!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!7!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!8!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!9!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!10!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!11!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!8!12!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll ">Cps</td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!1!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!2!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!3!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!4!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!5!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!6!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!7!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!8!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!9!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!10!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!11!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=4!8!12!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll ">Nc</td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!1!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!2!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!3!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!4!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!5!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!6!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!7!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!8!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!9!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!10!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!11!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=5!8!12!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll ">&nbsp;Ns</td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!1!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!2!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!3!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!4!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!5!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!6!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!7!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!8!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!9!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!10!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!11!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=6!8!12!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll ">&nbsp;Razem </td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!1!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!2!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!3!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!4!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!5!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!6!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!7!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!8!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!9!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!10!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!11!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!8!12!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll  col_60 center">ogółem za okres oceny</td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!1!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!2!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!3!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!4!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!5!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!6!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!7!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!8!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!9!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!10!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!11!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_80_fest_fest center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=8!8!12!1')">
                        <asp:Label CssClass="normal" ID="tab_8_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">

            <br />

            &nbsp;<asp:Label ID="Label15" runat="server" Text="IV.2.1 Wielkość (stan) referatów sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel9" runat="server" Text="tabela 9  \/\/\/" Visible="False"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>
            <br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder3"></asp:PlaceHolder>
            <br />
        </div>
        <br />
        <div class="page-break">
            <strong>Dział IV.2.3</strong> Ruch spraw i obciążenie sędziów w Wydziale
        <asp:Label ID="infoLabel12" runat="server" Text="tabela 12  \/\/\/" Visible="False"></asp:Label>
            <br />
            <div id="TABELA5" class="page-break">
                <table style="width: 100%;">
                    <tr>
                        <td class="borderAll center" rowspan="7">Ogólem</td>
                        <td class="borderAll center">kategoria Spraw</td>
                        <td class="borderAll center col_81">rok
                        </td>
                        <td class="borderAll center col_81">wpływ
                        </td>
                        <td class="borderAll center col_81">załatwienia
                        </td>
                        <td class="borderAll center col_81">pozostałość
                        </td>
                        <td class="borderAll center col_81">sprawy zawieszone</td>
                        <td class="borderAll center col_81">wpływ na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>
                        <td class="borderAll center col_81">załatwienia na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>
                        <td class="borderAll center col_81">pozostałość na sędziego według liczby sędziów i wakujących stanowisk sędziowskich w ramach limitu</td>
                        <td class="borderAll center col_81">wpływ na sędziego według obsady średnio-okresowej (efektywnego czasu pracy)</td>
                        <td class="borderAll center col_81">załatwienia na sędziego według obsady średnio-okresowej (efektywnego czasu pracy)</td>
                        <td class="borderAll center col_81">pozostałość na sędziego według obsady średnio-okresowej (efektywnego czasu pracy)</td>
                        <td class="borderAll center col_81">wskaźnik pozostałości</td>
                        <td class="borderAll center col_81">efektywny czas pracy</td>
                    </tr>
                    <tr>
                        <td class="borderAll center">C</td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!1!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!2!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!3!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!4!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!5!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!6!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!7!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!8!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!9!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!10!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!11!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!12!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!12!13!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w01_c13" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">Cgg</td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!1!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!2!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!3!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!4!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!5!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!6!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!7!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!8!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!9!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!10!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!11!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!12!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!12!13!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w02_c13" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">Co</td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!1!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!2!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!3!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!4!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!5!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!6!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!7!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!8!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!9!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!10!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!11!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!12!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!12!13!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w03_c13" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">Cps</td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!1!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!2!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!3!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!4!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!5!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!6!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!7!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!8!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!9!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!10!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!11!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!12!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!12!13!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w04_c13" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">Nc</td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!1!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!2!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!3!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!4!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!5!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!6!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!7!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!8!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!9!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!10!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!11!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!12!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=5!12!13!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w05_c13" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center">Ns</td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!1!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!2!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!3!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!4!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!5!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!6!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!7!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!8!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!9!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!10!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!11!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!12!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=6!12!13!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w06_c13" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center" colspan="2">RAZEM</td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!1!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!2!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!3!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!4!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!5!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!6!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!7!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!8!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!9!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!10!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!11!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!12!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=7!12!13!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w07_c13" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="borderAll center" colspan="2">OGÓŁEM za okres oceny</td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!1!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!2!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!3!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!4!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!5!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!6!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!7!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!8!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!9!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!10!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!11!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!12!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c12" runat="server" Text="0"></asp:Label></a></td>
                        <td class="borderAll center col_81">
                            <a href="javascript: openPopup('popup.aspx?sesja=8!12!13!1')">
                                <asp:Label CssClass="normal" ID="tab_12_w08_c13" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="page-break">
            &nbsp;<asp:Label ID="Label12" runat="server" Text="Dział IV.2.4. Ruch spraw i obciążenie poszczególnych referendarzy sądowych"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel13" runat="server" Text="tabela 13  \/\/\/" Visible="False"></asp:Label>
            <br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder13"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break">
            Dział .IV.3.1.3.2.3.3&nbsp;&nbsp;&nbsp;
            <asp:Label ID="infoLabel14" runat="server" Text="tabela 14  \/\/\/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll wciecie">IV.3.1. Prawidłowość przydzielania spraw przez przewodniczącego wydziału oraz przestrzeganie zasady równomiernego obciążania pracą sędziów</td>
                    <td class="center borderAll col_250"><a href="javascript: openPopup('popup.aspx?sesja=1!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">IV.3.2. Prawidłowość przydzielania spraw przez przewodniczącego wydziału oraz przestrzeganie zasady równomiernego obciążania pracą referendarzy sądowych</td>
                    <td class="center borderAll col_250"><a href="javascript: openPopup('popup.aspx?sesja=2!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">IV.3.3. Przestrzeganie zasady równomiernego obciążania pracą asystentów sędziów</td>
                    <td class="center borderAll col_250"><a href="javascript: openPopup('popup.aspx?sesja=3!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>
        <div id="TABELA5" class="page-break">
            <asp:PlaceHolder runat="server" ID="tablePlaceHolderTab15"></asp:PlaceHolder>
            <br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolderTab16"></asp:PlaceHolder>
            <br />
        </div>

        <div class="page-break">
            &nbsp;<asp:PlaceHolder runat="server" ID="tablePlaceHolder17"></asp:PlaceHolder>
        </div>
        <div class="page-break">
            <br />
            IV.5.5. Inne dane statystyczne, istotne z uwagi na specyfikę rozpoznawanych spraw lub wykonywanych zadań, w tym w szczególności dane dotyczące struktury załatwień<table style="width: 100%;">
                <tr>
                    <td>IV.5.6 Istotne czynniki mające wpływ na sprawność postępowań sądowych</td>
                    <td><a href="javascript: openPopup('popup.aspx?sesja=1!21!1!3')">
                        <asp:Label CssClass="normal" ID="tab_21_w01_c01" runat="server" Text=""></asp:Label></a></td>
                </tr>
                <tr>
                    <td>IV.5.7 Sprawność postępowania miedzyinstancyjnego</td>
                    <td><a href="javascript: openPopup('popup.aspx?sesja=1!21!2!3')">
                        <asp:Label CssClass="normal" ID="tab_21_w02_c01" runat="server" Text=""></asp:Label></a></td>
                </tr>
                <tr>
                    <td>IV.5.8. Liczba spraw zawieszonych (ogółem)</td>
                    <td><a href="javascript: openPopup('popup.aspx?sesja=1!21!3!3')">
                        <asp:Label CssClass="normal" ID="tab_21_w03_c01" runat="server" Text=""></asp:Label></a></td>
                </tr>
                <tr>
                    <td>IV.5.9. Prawidłowość kontroli spraw zawieszonych</td>
                    <td><a href="javascript: openPopup('popup.aspx?sesja=1!21!3!3')">
                        <asp:Label CssClass="normal" ID="tab_21_w04_c01" runat="server" Text=""></asp:Label></a></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
        <div class="page-break">
            IV.6.1. Terminowość sporządzania uzasadnień i stabilność orzecznictwa w wydziale (ogółem)

 <table style="width: 100%;">
     <tr>
         <td class="borderAll center" rowspan="3">Kategoria
      <br />
             spraw</td>
         <td class="borderAll center" rowspan="3">Rok</td>
         <td class="borderAll center" colspan="10">liczba sporządzonych uzasadnień</td>
         <td class="borderAll center" colspan="5" rowspan="2">roztrzygnięcie II instancji*</td>
     </tr>
     <tr>
         <td class="borderAll center" rowspan="2">ogół</td>
         <td class="borderAll center" rowspan="2">w terminie ustawowym</td>
         <td class="borderAll center" colspan="8">po upływie terminu ustawowego</td>
     </tr>
     <tr>
         <td class="borderAll center">1-14 dni</td>
         <td class="borderAll center">w tym nieuspra-wiedli-wione</td>
         <td class="borderAll center">15-30 dni</td>
         <td class="borderAll center">w tym nieuspra-wiedli-wione</td>
         <td class="borderAll center">15-30 dni</td>
         <td class="borderAll center">w tym nieuspra-wiedli-wione</td>
         <td class="borderAll center">
             <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; width: 43pt"
                 width="57">
                 <colgroup>
                     <col style="mso-width-source: userset; mso-width-alt: 1817; width: 43pt" width="57" />
                 </colgroup>
                 <tr height="141" style="mso-height-source: userset; height: 105.75pt">
                     <td class="xl65" height="141" width="57">ponad 3 mies.</td>
                 </tr>
             </table>
         </td>
         <td class="borderAll center">w tym nieuspra-wiedliwione</td>
         <td class="borderAll center">liczba spraw poddanych kontroli instancyjnej</td>
         <td class="borderAll center">utrzymano w mocy</td>
         <td class="borderAll center">zmieniono</td>
         <td class="borderAll center">uchylono i przekazano do ponownego roztrzy-gnięcia</td>
         <td class="borderAll center">załatwiono w inny sposób</td>
     </tr>
     <tr>
         <td class="col_80_fest_fest borderAll">C</td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!1!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!2!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!3!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!4!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!5!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!6!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!7!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!8!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!9!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!10!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!11!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!12!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!13!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!14!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!15!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c15" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=1!22!16!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w01_c16" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="col_80_fest_fest borderAll">Cgg</td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!1!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!2!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!3!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!4!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!5!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!6!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!7!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!8!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!9!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!10!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!11!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!12!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!13!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!14!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!15!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c15" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=2!22!16!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w02_c16" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="col_80_fest_fest borderAll">Co</td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!1!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!2!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!3!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!4!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!5!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!6!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!7!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!8!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!9!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!10!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!11!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!12!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!13!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!14!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!15!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c15" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=3!22!16!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w03_c16" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="col_80_fest_fest borderAll">Cps</td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!1!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!2!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!3!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!4!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!5!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!6!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!7!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!8!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!9!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!10!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!11!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!12!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!13!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!14!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!15!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c15" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=4!22!16!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w04_c16" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="col_80_fest_fest borderAll">Nc</td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!1!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!2!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!3!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!4!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!5!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!6!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!7!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!8!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!9!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!10!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!11!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!12!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!13!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!14!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!15!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c15" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=5!22!16!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w05_c16" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="col_80_fest_fest borderAll">Ns</td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!1!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!2!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!3!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!4!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!5!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!6!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!7!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!8!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!9!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!10!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!11!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!12!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!13!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!14!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!15!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c15" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll">
             <a href="javascript: openPopup('popup.aspx?sesja=6!22!16!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w06_c16" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="col_80_fest_fest borderAll gray">Razem</td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!1!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c01" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!2!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!3!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!4!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!5!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!6!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!7!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!8!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!9!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!10!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!11!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!12!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!13!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!14!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!15!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c15" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_80_fest_fest borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=7!22!16!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w07_c16" runat="server" Text="0"></asp:Label></a></td>
     </tr>
     <tr>
         <td class="col_81 center borderAll gray" colspan="2">Og</td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!2!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c02" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!3!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c03" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!4!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c04" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!5!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c05" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!6!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c06" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!7!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c07" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!8!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c08" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!9!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c09" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!10!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c10" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!11!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c11" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!12!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c12" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!13!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c13" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!14!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c14" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!15!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c15" runat="server" Text="0"></asp:Label></a></td>
         <td class="col_81 center borderAll gray">
             <a href="javascript: openPopup('popup.aspx?sesja=8!22!16!3')">
                 <asp:Label CssClass="normal" ID="tab_22_w08_c16" runat="server" Text="0"></asp:Label></a></td>
     </tr>
 </table>
            * w pionie karnym należy wskazać rozstrzygnięcia co do osób
                  <br />
        </div>
        <div class="page-break">
            IV.6.2. Terminowość sporządzania uzasadnień i stabilność orzecznictwa poszczególnych sędziów
             <br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder23"></asp:PlaceHolder>

            <br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder27"></asp:PlaceHolder>

            <br />
            <asp:PlaceHolder runat="server" ID="tablePlaceHolder28"></asp:PlaceHolder>

            <br />
        </div>

        <div class="page-break">

            <asp:PlaceHolder runat="server" ID="tablePlaceHolder26"></asp:PlaceHolder>

            <br />
        </div>

        <div class="page-break">
            <br />
            <table>
                <tr>
                    <td>IV. 7.7. Uwagi do organizacji pracy wydziału w zakresie toku wewnętrznego urzędowania sądu</td>
                    <td class="col_120">
                        <asp:TextBox CssClass="normal center" ID="tab_30_w01_c01" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <br />
                        IV. 7.8. Stwierdzone nieprawidłowości w zakresie toku wewnętrznego urzędowania sądu</td>
                    <td class="col_120">
                        <asp:TextBox CssClass="normal center" ID="tab_30_w02_c01" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <br />
                        IV.7.9. Materiał źródłowy, na podstawie którego dokonano ustaleń</td>
                    <td class="col_120">
                        <asp:TextBox CssClass="normal center" ID="tab_30_w03_c01" runat="server" Text=""></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <br />
                        IV.7.10. Wnioski</td>
                     <td class="col_120">
                        <asp:TextBox CssClass="normal center" ID="tab_30_w04_c01" runat="server" Text="0"></asp:TextBox></td>
                   
                </tr>
            </table>
            <br />
        </div>
        <div id="TABELA31" class="page-break">
            <br />
            V.1. Liczba i sposób rozpoznania skarg wniesionych na podstawie ustawy z dnia 17 czerwca 2004 r. o skardze na naruszenie prawa strony do rozpoznania sprawy w postępowaniu przygotowawczym prowadzonym lub nadzorowanym przez prokuratora i postępowaniu sądowym bez nieuzasadnionej zwłoki (Dz. U. Nr 179, poz. 1843, z późn. zm.) bez postępowań nadzorowanych przez prokuratora<br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center gray col_70">kategoria spraw</td>
                    <td class="borderAll center gray">wpływ</td>
                    <td class="borderAll center gray">załatwienia</td>
                    <td class="borderAll center gray">pozostałość</td>
                    <td class="borderAll center gray">uwzględniono w całości lub części</td>
                    <td class="borderAll center gray">oddano</td>
                    <td class="borderAll center gray">załatwiono w inny sposób</td>
                    <td class="borderAll center gray">uwzględniono, w tym zasądzono odszkodowanie</td>
                    <td class="borderAll center gray">kwota zasądzonego odszko-dowania</td>
                </tr>
                <tr>
                    <td class="borderAll center gray col_70">C</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!31!1!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!31!2!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!31!3!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!31!4!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!31!5!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!31!6!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!31!7!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=1!31!8!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center gray col_70">Cgg</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!31!1!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!31!2!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!31!3!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!31!4!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!31!5!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!31!6!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!31!7!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=2!31!8!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center gray col_70">Co</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!31!1!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!31!2!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!31!3!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!31!4!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!31!5!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!31!6!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!31!7!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=3!31!8!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center gray col_70">Cps</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!31!1!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!31!2!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!31!3!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!31!4!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!31!5!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!31!6!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!31!7!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=4!31!8!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center gray col_70">Nc</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!31!1!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!31!2!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!31!3!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!31!4!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!31!5!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!31!6!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!31!7!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=5!31!8!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center gray col_70">Ns</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!31!1!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!31!2!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!31!3!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!31!4!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!31!5!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!31!6!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!31!7!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=6!31!8!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center gray col_70">Razem</td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!31!1!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!31!2!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!31!3!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!31!4!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!31!5!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!31!6!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!31!7!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_90">
                        <a href="javascript: openPopup('popup.aspx?sesja=7!31!8!3')">
                            <asp:Label CssClass="normal" ID="tab_31_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
        </div>
        <div class="page-break">
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>V.2. Uwagi do organizacji pracy wydziału w zakresie toku wewnętrznego urzędowania sądu</td>
                    <td>
                        <asp:TextBox CssClass="normal center" ID="tab_32_w01_c01" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>V.3. Stwierdzone nieprawidłowości w zakresie toku wewnętrznego urzędowania sądu</td>
                    <td>
                        <asp:TextBox CssClass="normal center" ID="tab_32_w02_c01" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>V.4. Inne wnioski</td>
                    <td>
                        <asp:TextBox CssClass="normal center" ID="tab_32_w03_c01" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>V.5. Materiał źródłowy, na podstawie którego dokonano ustaleń</td>
                    <td>
                        <asp:TextBox CssClass="normal center" ID="tab_32_w04_c01" runat="server"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>

        <div class="page-break">
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll">VI.1. Wnioski dotyczące pracy wydziału</td>
                    <td class="borderAll" colspan="3"><a href="javascript: openPopup('popup.aspx?sesja=1!31!1!3')" class="normal center">
                        <asp:Label CssClass="normal" ID="tab_33_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll col_250">Data sporządzenia protokołu</td>
                    <td class="borderAll col_250">&nbsp;</td>
                    <td class="borderAll col_250">Podpis</td>
                    <td class="borderAll col_250">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <br />
        </div>
        <div>
            <br />
            Raport statystyczny
                    <asp:Label ID="Label27" runat="server"></asp:Label>
            &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
            &nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label16" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>