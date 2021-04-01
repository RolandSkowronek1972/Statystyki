<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oglk2.aspx.cs" Inherits="Statystyki_2018.oglk2" %>

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
            @page {
                size: 29cm 21.7cm;
                margin: 0mm 0mm 0mm 0mm;
            }

                .horizont {
                    transform: translate(-60mm, 0) scale(0.60);
                    -webkit-transform: translate(-60mm, 0) scale(0.60);
                    -moz-transform: translate(-60mm, 0) scale(0.60);
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
                    <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" />
                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px; z-index: 11;">

        <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto; z-index: 10;">
            <asp:Label runat="server" ID="Label9" Visible="False"></asp:Label>
        </div>

        <div id="zalatwienia">
            <br />

            <asp:Label ID="lbTabela1" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel1" runat="server" Text="Tabela 1 \/" Visible="False"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="naglowekTabeli1a"
                Width="99%" ShowHeader="False" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="25px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label404" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label ID="Label405" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_325" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label406" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label407" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label408" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label409" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label410" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label411" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label412" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
            <br />
        </div>
        <div id="wyznaczenia" class="page-break">
            <asp:Label ID="lbTabela2" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel2" runat="server" Text="Tabela 2 \/" Visible="False"></asp:Label>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowCreated="GridView3_RowCreated" Width="95%" ShowHeader="False" OnRowDataBound="GridView3_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="25px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">

                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_325" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label301" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <RowStyle Height="25px" HorizontalAlign="Center" />
            </asp:GridView>
            <br />
        </div>
        <div id="Tabela 3" class="page-break">
            &nbsp;<asp:Label ID="lbTabela3" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel3" runat="server" Text="Tabela 3 \/" Visible="False"></asp:Label>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnRowCreated="GridView4_RowCreated" Width="95%" ShowHeader="False" OnRowDataBound="GridView4_RowDataBound" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="25px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="nazwisko" SortExpression="nazwisko">

                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label ID="Label13" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_325" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label401" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label402" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label403" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
            <br />
        </div>
        <div id="TABELA4" class="page-break">
            &nbsp;<asp:Label ID="lbTabela4" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel4" runat="server" Text="Tabela 4 \/" Visible="False"></asp:Label>

            <br />
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="2">Liczba spraw skierowanych do </td>
                    <td class="borderAll center" colspan="3">Wynik mediacji</td>
                    <td class="borderAll center col_200" rowspan="2">czynności nadzorcze</td>
                </tr>
                <tr>
                    <td class="borderAll center">Ugoda</td>
                    <td class="borderAll center">Brak ugody</td>
                    <td class="borderAll center">inne</td>
                </tr>
                <tr>
                    <td class="borderAll center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!1!3')">
                            <asp:Label CssClass="normal" ID="tab_04_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!2!3')">
                            <asp:Label CssClass="normal" ID="tab_04_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!3!3')">
                            <asp:Label CssClass="normal" ID="tab_04_w01_c03" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!4!3')">
                            <asp:Label CssClass="normal" ID="tab_04_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    </td>

                   <td class="borderAll center">

                       <asp:TextBox ID="tab_04_w01_c05" runat="server" Width="95%"></asp:TextBox></td>
                </tr>
            </table>

            <br />
        </div>
        <div id="Tabela 5" class="page-break">
            &nbsp;<asp:Label ID="lbTabela5" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel5" runat="server" Text="Tabela 5 \/" Visible="False"></asp:Label>

            <br />
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="col_140 center borderAll">Wysłano</td>
                    <td class="col_140 center borderAll">zwrócono z opinią</td>
                    <td class="col_140 center borderAll">Zwrócono bez opinii</td>
                    <td class="col_140 center borderAll">zwrócono po terminie</td>
                    <td class="col_140 center borderAll">Termin opinii przedłużono<br />
                    </td>
                    <td class="col_140 center borderAll">ponaglono o wykonanie opinii</td>
                    <td class="col_140 center borderAll">W terminie 14 dni wydano post. o wynagrodzeniu</td>
                    <td class="col_140 center borderAll">Skierowano do wykonania w terminie 14 dni</td>
                </tr>
                <tr>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!1!3')">
                            <asp:Label CssClass="normal" ID="tab_05_w01_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!2!3')">
                            <asp:Label CssClass="normal" ID="tab_05_w01_c02" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!3!3')">
                            <asp:Label CssClass="normal" ID="tab_05_w01_c03" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!4!3')">
                            <asp:Label CssClass="normal" ID="tab_05_w01_c04" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!5!3')">
                            <asp:Label CssClass="normal" ID="tab_05_w01_c05" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!6!3')">
                            <asp:Label CssClass="normal" ID="tab_05_w01_c06" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!7!3')">
                            <asp:Label CssClass="normal" ID="tab_05_w01_c07" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_140 center borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!8!3')">
                            <asp:Label CssClass="normal" ID="tab_05_w01_c08" runat="server" Text="0"></asp:Label></a>
                    </td>
                </tr>
            </table>

            <br />
        </div>
        <div id="Tabela 6" class="page-break">
            &nbsp;<asp:Label ID="lbTabela6" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel6" runat="server" Text="Tabela 6 \/" Visible="False"></asp:Label>

            <br />
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False"
                DataSourceID="tabela_6" OnRowCreated="naglowekTabeli6"
                Width="95%" ShowHeader="False" OnRowDataBound="stopkaTabeli6" ShowFooter="True" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="25px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label413" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            &nbsp;<asp:Label ID="Label414" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_325" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label415" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_02">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label416" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_03">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label417" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label418" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label419" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_04" SortExpression="d_04">

                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label420" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_114" />
                    </asp:TemplateField>
                </Columns>
                <FooterStyle Font-Bold="True" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="tabela_6" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id, ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22, d_23, d_24, d_25, d_26, d_27, d_28,d_29, d_30, d_31, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 6) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />
        </div>
        <br />
        <div id="TABELA7" class="page-break">
            &nbsp;<asp:Label ID="lbTabela7" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel7" runat="server" Text="Tabela 7 \/" Visible="False"></asp:Label>

            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center col_330">&nbsp;</td>
                    <td class="borderAll center col_330">Liczba spraw</td>
                    <td class="borderAll center col_330">Termin czynności nadzorczych - daty kontroli z ostatnich 6 miesięcy</td>
                </tr>
                <tr>
                    <td class="borderAll center col_330">Zastosowanie tymczsowego aresztowania</td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=1!7!1!3')">
                        <asp:Label CssClass="normal" ID="tab_07_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330">
                        <asp:TextBox ID="tab_07_w01_c02" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="borderAll center col_330">Stan zdrowia</td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=2!7!1!3')">
                        <asp:Label CssClass="normal" ID="tab_07_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330">
                        <asp:TextBox ID="tab_07_w02_c02" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="borderAll center col_330">Inne przyczyny</td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=3!7!1!3')">
                        <asp:Label CssClass="normal" ID="tab_07_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330">
                        <asp:TextBox ID="tab_07_w03_c02" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="borderAll center col_330">Razem</td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=4!7!1!3')">
                        <asp:Label CssClass="normal" ID="tab_07_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330">
                        <asp:TextBox ID="tab_07_w04_c02" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <br />
        </div>
        <div id="TABELA8" class="page-break">
            &nbsp;<asp:Label ID="lbTabela8" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel8" runat="server" Text="Tabela 8 \/" Visible="False"></asp:Label>

            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center col_250" rowspan="2">Wpływ wniosku</td>
                    <td class="borderAll center col_200" colspan="3">Termin przesłuchania</td>
                    <td class="borderAll center col_200" rowspan="2">Przyczyny przedłużenia przesłuchania jeżeli przekroczono termin 7 dni od wpłynięcia wniosku</td>
                </tr>
                <tr>
                    <td class="borderAll center">do 7 dni</td>
                    <td class="borderAll center">do 30 dni </td>
                    <td class="borderAll center">powyżej 30 dni</td>
                </tr>
                <tr>
                    <td class="borderAll center col_250">Z art. 185 a k.p.k.</td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=1!8!1!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=1!8!2!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=1!8!2!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center" rowspan="3">
                        <asp:TextBox ID="TextBox1" runat="server" Height="57px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="borderAll center col_250">Z art. 185 b k.p.k.</td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=2!8!1!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=2!8!2!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=2!8!3!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_250">Z art. 185 c k.p.k.</td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=3!8!1!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=3!8!2!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=3!8!3!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_250">Z art. 185 d k.p.k.</td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=4!8!1!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=4!8!2!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_330"><a href="javascript:openPopup('popup.aspx?sesja=4!8!3!3')">
                        <asp:Label CssClass="normal" ID="tab_08_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center">
                        <asp:TextBox ID="TextBox2" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />

            <br />
        </div>
        <div id="TABELA9" class="page-break">
            &nbsp;<asp:Label ID="lbTabela9" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel9" runat="server" Text="Tabela 9 \/" Visible="False"></asp:Label>

            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center">Sprawy wg repetytoriów/wykazów</td>
                    <td class="col_36 borderAll">L. p.</td>
                    <td class="col_250 borderAll">Ilość spraw wyznaczonych</td>
                    <td class="col_250 borderAll">Ilość spraw odroczonych</td>
                </tr>
                <tr>
                    <td class="wciecie borderAll col_200F">Ko</td>
                    <td class="col_36 borderAll">1</td>
                    <td class="col_250 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!9!1!3')">
                        <asp:Label CssClass="normal" ID="tab_09_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_250 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=1!9!2!3')">
                        <asp:Label CssClass="normal" ID="tab_09_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll col_200F">Ko sprawy karne</td>
                    <td class="col_36 borderAll">2</td>
                    <td class="col_250 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!9!1!3')">
                        <asp:Label CssClass="normal" ID="tab_09_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_250 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=2!9!2!3')">
                        <asp:Label CssClass="normal" ID="tab_09_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="wciecie borderAll col_200F">Ko - sprawy wykroczeniowe</td>
                    <td class="col_36 borderAll">3</td>
                    <td class="col_250 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!9!1!3')">
                        <asp:Label CssClass="normal" ID="tab_09_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="col_250 borderAll"><a href="javascript:openPopup('popup.aspx?sesja=3!9!2!3')">
                        <asp:Label CssClass="normal" ID="tab_09_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>
        <div id="TABELA10" class="page-break">
            &nbsp;<asp:Label ID="lbTabela10" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel10" runat="server" Text="Tabela 10 \/" Visible="False"></asp:Label>

            <br />
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="2">&nbsp;</td>
                    <td class="borderAll center">Parametr</td>
                    <td class="borderAll center">Grzywny karne i nieletnich</td>
                    <td class="borderAll center">grzywny cywilne, rodzinne i gospodarcze</td>
                    <td class="borderAll center">opłaty cywilne i gospodarcze</td>
                    <td class="borderAll center">opłty i koszty karne</td>
                    <td class="borderAll center">koszty w sprawach rodzinnych i nieletnich</td>
                    <td class="borderAll center">Zaległości razem</td>
                </tr>
                <tr>
                    <td class="borderAll wciecie">Zaległości na koniec</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140" rowspan="4">I KWARTAŁ</td>
                    <td class="borderAll center col_140">przypisano</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140">uiszczono</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140">odpisano</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">zaległość na koniec I kwartału</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140" rowspan="4">II KWARTAŁ</td>
                    <td class="borderAll center col_140">przypisano</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=6!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140">uiszczono</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=7!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140">odpisano</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=8!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">zaległość na koniec II kwartału</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=9!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140" rowspan="4">III KWARTAŁ</td>
                    <td class="borderAll center col_140">przypisano</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=10!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140">uiszczono</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=11!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140">odpisano</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=12!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">zaległość na koniec III kwartału</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=13!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140" rowspan="4">IV KWARTAŁ</td>
                    <td class="borderAll center col_140">przypisano</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=14!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140">uiszczono</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=15!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=15!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=15!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=15!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=15!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=15!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_140">odpisano</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=16!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=16!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=16!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=16!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=16!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=16!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w16_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll">zaległość na koniec IV kwartału</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=17!10!1!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w17_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=17!10!2!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w17_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=17!10!3!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w17_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=17!10!4!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w17_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=17!10!5!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w17_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=17!10!6!3')">
                        <asp:Label CssClass="normal" ID="tab_10_w17_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>
        <div id="TABELA11" class="page-break">
            &nbsp;<asp:Label ID="lbTabela11" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel11" runat="server" Text="Tabela 11 \/" Visible="False"></asp:Label>

            <br />
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center">KWARTAŁ </td>
                    <td class="borderAll center">Grzywny karne i nieletnich</td>
                    <td class="borderAll center">grzywny cywilne, rodzinne i gospodarcze</td>
                    <td class="borderAll center">opłaty cywilne i gospodarcze</td>
                    <td class="borderAll center">opłaty i koszty karne</td>
                    <td class="borderAll center">koszty w sprawach rodzinnych i nieletnich</td>
                    <td class="borderAll center">razem</td>
                </tr>
                <tr>
                    <td class="borderAll center">I KWARTAŁ </td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!11!1!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!11!2!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!11!3!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!11!4!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!11!5!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!11!6!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">I I KWARTAŁ</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!11!1!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!11!2!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!11!3!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!11!4!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!11!5!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!11!6!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">I I I&nbsp; KWARTAŁ</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!11!1!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!11!2!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!11!3!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!11!4!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!11!5!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!11!6!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">IV KWARTAŁ</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!11!1!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!11!2!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!11!3!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!11!4!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!11!5!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!11!6!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">Razem Rok</td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!11!1!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!11!2!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!11!3!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!11!4!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!11!5!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=5!11!6!3')">
                        <asp:Label CssClass="normal" ID="tab_11_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>
        <div id="TABELA12" class="page-break">
            &nbsp;<asp:Label ID="lbTabela12" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel12" runat="server" Text="Tabela 12 \/" Visible="False"></asp:Label>

            <br />
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center">Parametr</td>
                    <td class="borderAll center">zamiana na grzywnę</td>
                    <td class="borderAll center">zamiana z grzywny na areszt lub pozbawienie wolności </td>
                </tr>
                <tr>
                    <td class="borderAll center">rok roku </td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!12!1!3')">
                        <asp:Label CssClass="normal" ID="tab_12_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=1!12!2!3')">
                        <asp:Label CssClass="normal" ID="tab_12_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">I półrocze roku </td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!12!1!3')">
                        <asp:Label CssClass="normal" ID="tab_12_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=2!12!2!3')">
                        <asp:Label CssClass="normal" ID="tab_12_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">II półrocze roku </td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!12!1!3')">
                        <asp:Label CssClass="normal" ID="tab_12_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=3!12!2!3')">
                        <asp:Label CssClass="normal" ID="tab_12_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center">razem rok </td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!12!1!3')">
                        <asp:Label CssClass="normal" ID="tab_12_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_200"><a href="javascript:openPopup('popup.aspx?sesja=4!12!2!3')">
                        <asp:Label CssClass="normal" ID="tab_12_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            <br />
        </div>
        <div id="TABELA13" class="page-break">
            &nbsp;<asp:Label ID="lbTabela13" runat="server"></asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel13" runat="server" Text="Tabela 13 \/" Visible="False"></asp:Label>

            <br />
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="3" colspan="2">&nbsp;</td>
                    <td class="borderAll center" rowspan="3">Zaległość na poczatek
                        <br />
                        okresu sprawoz-dawczego BO </td>
                    <td class="borderAll center" rowspan="3">Przypis należności </td>
                    <td class="borderAll center" rowspan="3">Odpis należności </td>
                    <td class="borderAll center" rowspan="3">Uiszczenia należności przypi-<br />
                        sanych </td>
                    <td class="borderAll center" colspan="5">NALEŻNOŚCI NIEUREGULOWANE
                        <br />
                        (zaległość na koniec okresu sprawozdawczego)
                    </td>
                </tr>
                <tr>
                    <td class="borderAll center" rowspan="2">ogółem </td>
                    <td class="borderAll center" colspan="3">należności krótkotermionowe: </td>
                    <td class="borderAll center" rowspan="2">należność niewymagalna - termin<br />
                        &nbsp;płatności przypada
                        <br />
                        na kolejny rok budżetowy </td>
                </tr>
                <tr>
                    <td class="borderAll center">ogółem: należności
                        <br />
                        krótko-<br />
                        termionowe (płatność<br />
                        &nbsp;przypada na dany rok budżetowy), w tym </td>
                    <td class="borderAll center">należności wymagalne<br />
                        &nbsp;na dany okres sprawoz-dawczy </td>
                    <td class="borderAll center">należności przypadające
                        <br />
                        do końca roku budżetowego </td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-01 </td>
                    <td class="borderAll center col_150">grzywny karne zwykłe </td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=1!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-03 </td>
                    <td class="borderAll center col_150">grzywny karne samoistne </td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=2!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-05 </td>
                    <td class="borderAll center col_150">grzywny cywilne </td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=3!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-07 </td>
                    <td class="borderAll center col_150">grzywny nieletnich </td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=4!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-09 </td>
                    <td class="borderAll center col_150">grzywny rodzinne </td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=5!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w05_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-11</td>
                    <td class="borderAll center col_150">grzywny gospodarcze</td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=6!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w06_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="gray center borderAll">&nbsp;</td>
                    <td class="gray center borderAll">RAZEM 0570</td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=7!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w07_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0690-01</td>
                    <td class="borderAll center col_150">koszty i opłaty karne</td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=8!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w08_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0690-03</td>
                    <td class="borderAll center col_150">koszty i opłaty cywilne</td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=9!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w09_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0690-05</td>
                    <td class="borderAll center col_150">koszty i opłaty nieletnich</td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=10!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w10_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0690-07</td>
                    <td class="borderAll center col_150">koszty i opłaty rodzinnych</td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=11!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w11_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0690-09</td>
                    <td class="borderAll center col_150">koszty i opłaty gospodarczych</td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=12!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w12_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">&nbsp;</td>
                    <td class="borderAll center col_150">&nbsp;</td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100"><a href="javascript:openPopup('popup.aspx?sesja=13!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w13_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="gray center borderAll">&nbsp;</td>
                    <td class="gray center borderAll">RAZEM 0630</td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=14!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w14_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>

                <tr>
                    <td class="gray center borderAll">&nbsp;</td>
                    <td class="gray center borderAll">OGÓŁEM </td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="gray center borderAll"><a href="javascript:openPopup('popup.aspx?sesja=15!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w15_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">&nbsp;</td>
                    <td class="borderAll center col_150">&nbsp;</td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!1!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!2!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!3!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!4!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!5!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!6!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c06" runat="server" Text="0"></asp:Label></a></td>

                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!7!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c07" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!8!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c08" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll center col_100 gray"><a href="javascript:openPopup('popup.aspx?sesja=16!13!9!3')">
                        <asp:Label CssClass="normal" ID="tab_13_w16_c09" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                </table>

            par. 0570 - grzywny, mandaty i inne kary pieniężne od osób fizycznych<br />
            par. 0580 - grzywny i inne kary pieniężne od osób prawnych i inych jednostek organizacyjnych<br />

            <br />
        </div>
        <div id="TABELA14" class="page-break">
            &nbsp;<asp:Label ID="lbTabela14" runat="server">INFORMACJA O REALIZACJI NALEŻNOŚCI </asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel14" runat="server" Text="Tabela 14 \/" Visible="False"></asp:Label>

            <br />
            <br />

            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" rowspan="2" colspan="2">&nbsp;</td>
                    <td class="borderAll center" rowspan="2">Zaległość na poczatek
                        <br />
                        okresu sprawoz-dawczego BO </td>
                    <td class="borderAll center" rowspan="2">Przypis należności </td>
                    <td class="borderAll center" rowspan="2">Odpis należności </td>
                    <td class="borderAll center" rowspan="2">Uiszczenia należności
                        <br />
                        przypisanych </td>
                    <td class="borderAll center" colspan="2">NALEŻNOŚCI NIEUREGULOWANE (zaległość na koniec okresu sprawozdawczego)</td>
                </tr>
                <tr>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">w tym:
                        <br />
                        należności
                        <br />
                        wymagalne</td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-02</td>
                    <td class="borderAll center col_200">grzywny karne os. Fizycznych</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=1!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-03</td>
                    <td class="borderAll center col_200">grzywny karne samoistne</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=2!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-01</td>
                    <td class="borderAll center col_200">grzywny cywilne</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=3!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-01</td>
                    <td class="borderAll center col_200">grzywny nieletnich</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=4!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0570-01</td>
                    <td class="borderAll center col_200">grzywny rodzinne</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=5!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">&nbsp;</td>
                    <td class="borderAll center col_200">RAZEM GRZYWNY 0570</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=6!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0580-01</td>
                    <td class="borderAll center col_200">grzywny przedsiębiorstw -cywilne</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=7!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0580-02</td>
                    <td class="borderAll center col_200">grzywny przedsiębiorstw -karne i inne</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=8!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">&nbsp;</td>
                    <td class="borderAll center col_200">RAZEM GRZYWNY 0580</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w09_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=9!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w09_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0630-02</td>
                    <td class="borderAll center col_200">koszty i opłaty karne</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w10_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=10!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w10_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0630-01</td>
                    <td class="borderAll center col_200">koszty i opłaty cywilne</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w11_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=11!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w11_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0630-01</td>
                    <td class="borderAll center col_200">koszty i opłaty nieletnich</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w12_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=12!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w12_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">0630-01</td>
                    <td class="borderAll center col_200">oszty i opłaty rodzinnych</td>

                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w13_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=13!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w13_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderAll center col_100">&nbsp;</td>
                    <td class="borderAll center col_200">RAZEM KOSZTY i OPŁATY</td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w14_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=14!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w14_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>

                <tr>
                    <td class="borderAll center col_100">&nbsp;</td>
                    <td class="borderAll center col_200">OGÓŁEM </td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!14!1!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!14!2!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!14!3!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!14!4!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!14!5!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w15_c05" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderAll col_120 center"><a href="javascript:openPopup('popup.aspx?sesja=15!14!6!3')">
                        <asp:Label CssClass="normal" ID="tab_14_w15_c06" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>

            par. 0570 - grzywny, mandaty i inne kary pieniężne od osób fizycznych<br />
            par. 0580 - grzywny i inne kary pieniężne od osób prawnych i inych jednostek organizacyjnych<br />

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

        <br />
    </div>
</asp:Content>