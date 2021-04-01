<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oglc3.aspx.cs" Inherits="Statystyki_2018.oglc3" %>
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
                margin: 0mm 0mm 0mm 0mm;
            }

            .horizont {
                transform: translate(-40mm, 0) scale(0.65);
                -webkit-transform: translate(-40mm, 0) scale(0.65);
                -moz-transform: translate(-40mm, 0) scale(0.65);
            }
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
                    <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" />

                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 30px;" class="content landscape">
        <div style="text-align: center">
            <asp:Label ID="LabelNazwaSadu" runat="server" Style="text-align: center; font-weight: 700" Text="Label"></asp:Label>
        </div>
        <br />
        <br />
       
            &nbsp;<asp:Label ID="Label1" runat="server" Text=" Liczba sporządzanych uzasadnień"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="False"></asp:Label>
            <br />
            <div id="TABELA1" >
                <table style="width: 99%;">
                    <tr>
                        <td class="borderAll center" rowspan="3">okres statystyczny</td>
                        <td class="borderAll center" rowspan="3">&nbsp;</td>
                        <td class="borderAll center" rowspan="3">razem</td>
                        <td class="borderAll center " rowspan="3">w tym liczba orzeczeń, w których sporządzono uzasadnienie i nie wniesiono środka zaskarżenia</td>
                        <td class="borderAll center" colspan="10">Terminowość sporządzania uzasadnień</td>
                    </tr>
                    <tr>
                        <td class="borderAll center " rowspan="2">w terminie ustawowym</td>
                        <td class="borderAll center" colspan="9">po upływie terminu ustawowego
                        </td>
                    </tr>
                    <tr>
                        <td class="borderAll center ">1-14 dni</td>
                        <td class="borderAll center ">w tym
      <br />
                            nieuspra-wiedli-wione</td>
                        <td class="borderAll center ">15-30 dni</td>
                        <td class="borderAll center ">w tym nieuspra-<br />
                            wiedl-iwione</td>
                        <td class="borderAll center ">pow. 1 do 3
                            <br />
                            m-cy</td>
                        <td class="borderAll center ">w tym nieuspra-<br />
                            wiedli-wione</td>
                        <td class="borderAll center ">ponad 3 m-ce</td>
                        <td class="borderAll center ">w tym nieuspra-<br />
                            wiedli-wione</td>
                        <td class="borderAll center ">uzasadnienia wygłoszone (art.328 § 11 kpc)</td>
                    </tr>
                    <tr>
                        <td class="col_80 center borderAll" rowspan="4">
                            <asp:Label ID="dateLabel01" runat="server"></asp:Label>
                        </td>
                        <td class="col_80 center borderAll">I Wydział Cywilny</td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!9!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!10!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!11!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=1!1!12!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w01_c12" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_80 center borderAll">II Wydział Cywilny</td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!9!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!10!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!11!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=2!1!12!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w02_c12" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_80 center borderAll">…………. Cywilny</td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!9!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!10!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!11!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=3!1!12!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w03_c12" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                    <tr>
                        <td class="col_80 center borderAll">pion cywilny SR w Żorach</td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!1!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!2!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!3!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!4!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!5!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!6!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!7!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!8!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!9!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c09" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!10!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c10" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!11!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c11" runat="server" Text="0"></asp:Label></a></td>
                        <td class="col_80 center borderAll">
                            <a href="javascript: openPopup('popup.aspx?sesja=4!1!12!3')">
                                <asp:Label CssClass="normal" ID="tab_1_w04_c12" runat="server" Text="0"></asp:Label></a></td>
                    </tr>
                </table>
</div>
                <br />
                <div class="page-break">
                    &nbsp;<asp:Label ID="Label7" runat="server" Text="Terminowość sporządzania uzasadnień"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel2" runat="server" Text="tabela 2" Visible="False"></asp:Label>
                    <br />

                    <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela2" Width="99%" ShowHeader="False" ShowFooter="True">
                        <Columns>

                            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                <ItemTemplate>
                                    <asp:Label ID="Label49" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                    <asp:Label ID="Label50" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="t2_nazwisko" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                        <asp:Label ID="Label_gwTabela13115" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                        <asp:Label ID="Label_gwTabela13116" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                        <asp:Label ID="Label_gwTabela13117" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                        <asp:Label ID="Label_gwTabela13118" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                        <asp:Label ID="Label_gwTabela13119" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                        <asp:Label ID="Label_gwTabela13120" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                        <asp:Label ID="Label_gwTabela13121" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                        <asp:Label ID="Label_gwTabela13122" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                        <asp:Label ID="Label_gwTabela13123" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                        <asp:Label ID="Label_gwTabela13124" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                <ItemTemplate>
                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                        <asp:Label ID="Label_gwTabela13125" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="col_60" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle CssClass="gray" />
                    </asp:GridView>

                 
                </div>
              
                   

                    <div id="TABELA3" class="page-break">
 &nbsp;<asp:Label ID="Label6" runat="server" Text="Ruch spraw"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel3" runat="server" Text="tabela 3" Visible="False"></asp:Label>
                    <br />
                        <table style="width: 99%;">
                            <tr>
                                <td class="borderAll center">Okres statystyczny</td>
                                <td class="borderAll center col_120">sąd</td>
                                <td class="borderAll center col_120">wydział</td>
                                <td class="borderAll center col_180">wpływ</td>
                                <td class="borderAll center">Pozostałość</td>
                                <td class="borderAll center">Liczba odbytych sesji</td>
                            </tr>
                            <tr>
                                <td class="col_180 center borderAll" rowspan="15">
                                    <asp:Label ID="dateLabel02" runat="server"></asp:Label>
                                </td>
                                <td class="borderAll wciecie" rowspan="3">SR Gliwice</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=1!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">II Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=2!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=2!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=2!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">pion cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=3!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=3!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=3!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">SR Jastrzębie Zdrój</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=4!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=4!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=4!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">SR Racibórz</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=5!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=5!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=5!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">SR Ruda Śląska</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=6!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=6!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=6!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie" rowspan="3">SR Rybnik</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=7!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=7!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=7!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">II Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=8!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=8!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=8!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">pion cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=9!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=9!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=9!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">SR Tarnowskie Góry</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=10!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=10!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=10!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">SR Wodzisław Śląski</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=11!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=11!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=11!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie" rowspan="3">SR Zabrze</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=12!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=12!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=12!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">VIII Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=13!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=13!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=13!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">pion cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=14!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=14!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=14!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll wciecie">SR Żory</td>
                                <td class="borderAll wciecie">I Wydział Cywilny</td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=15!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=15!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="col_121 center borderAll">
                                    <a href="javascript: openPopup('popup.aspx?sesja=15!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                            <tr>
                                <td class="borderAll center gray" colspan="2">Sądy Rejonowe</td>
                                <td class="borderAll center gray">RAZEM</td>
                                <td class="borderAll center gray">
                                    <a href="javascript: openPopup('popup.aspx?sesja=16!3!1!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                                <td class="borderAll center gray">
                                    <a href="javascript: openPopup('popup.aspx?sesja=16!3!2!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                                <td class="borderAll center gray">
                                    <a href="javascript: openPopup('popup.aspx?sesja=16!3!3!3')">
                                        <asp:Label CssClass="normal" ID="tab_3_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                            </tr>
                        </table>

                        <br />
                    </div>
                   
                      

                        <div id="TABELA4" class="page-break">
  &nbsp;<asp:Label ID="Label10" runat="server" Text="Stabilność i skargi"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="infoLabel4" runat="server" Text="tabela 4  \/\/\/" Visible="False"></asp:Label>
                        &nbsp;<br />

                            <table style="width: 99%;">
                                <tr>
                                    <td class="borderAll center">Okres statystyczny</td>
                                    <td class="borderAll center col_120">sąd</td>
                                    <td class="borderAll center col_120">wydział</td>
                                    <td class="borderAll center">Liczba spraw w których wniesiono apelację, skargę kasacyjną lub kasację
                                    </td>
                                    <td class="borderAll center">*Liczba spraw w których wydano orzeczenie podlegające zaskarżeniu tymi środkami</td>
                                    <td class="borderAll center">Liczba spraw, w kórych została uwzglęniona skarga w trybie ustawy z dnia 17.06.2004r. o skardze na naruszenie prawa strony do rozpoznania sprawy w postępowaniu przygotowawczym prowadzonym lub nadzorowanym przez przez prokuratora i postępowniu sądowym bez nieuzasadnionej zwłoki</td>
                                    <td class="borderAll center">Liczba spraw, w których doszło do stwierdzenia niezgodności z prawem prawomocnego orzecznia</td>
                                </tr>
                                <tr>
                                    <td class="col_180 center borderAll" rowspan="15">
                                        <asp:Label ID="dateLabel3" runat="server"></asp:Label>
                                    </td>
                                    <td class="borderAll wciecie" rowspan="3">SR Gliwice</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=1!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">II Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=2!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">pion cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=3!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">SR Jastrzębie Zdrój</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=4!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">SR Racibórz</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=5!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">SR Ruda Śląska</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=6!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie" rowspan="3">SR Rybnik</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=7!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">II Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=8!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">pion cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w09_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=9!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w09_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">SR Tarnowskie Góry</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w10_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=10!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w10_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">SR Wodzisław Śląski</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w11_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=11!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w11_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie" rowspan="3">SR Zabrze</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w12_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w12_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w12_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=12!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w12_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">VIII Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w13_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w13_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w13_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=13!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w13_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">pion cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w14_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w14_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w14_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=14!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w14_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll wciecie">SR Żory</td>
                                    <td class="borderAll wciecie">I Wydział Cywilny</td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w15_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w15_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w15_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="col_160 center borderAll">
                                        <a href="javascript: openPopup('popup.aspx?sesja=15!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w15_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                                <tr>
                                    <td class="borderAll center gray" colspan="2">Sądy Rejonowe</td>
                                    <td class="borderAll center gray">RAZEM</td>
                                    <td class="borderAll center gray">
                                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!1!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w16_c01" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="borderAll center gray">
                                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!2!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w16_c02" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="borderAll center gray">
                                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!3!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w16_c03" runat="server" Text="0"></asp:Label></a></td>
                                    <td class="borderAll center gray">
                                        <a href="javascript: openPopup('popup.aspx?sesja=16!4!4!3')">
                                            <asp:Label CssClass="normal" ID="tab_4_w16_c04" runat="server" Text="0"></asp:Label></a></td>
                                </tr>
                            </table>

                            <br />
                        </div>
                            

                            <div id="TABELA5" class="page-break">
                        &nbsp;<asp:Label ID="Label3" runat="server">Gminy</asp:Label>
                            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel5" runat="server" Text="tabela 5  \/\/\/" Visible="False"></asp:Label>
                            <br />
                                <table style="width: 99%;">
                                    <tr>
                                        <td class="borderAll center">Repetytorium</td>
                                        <td class="borderAll center">Wpływ spraw </td>
                                        <td class="borderAll center">Wpływ spraw z obszaru właściwości Gminy Miasta
                                        </td>
                                        <td class="borderAll center">Wpływ spraw z obszaru właściwości innych Gmin
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col_180 center borderAll">C</td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=1!5!1!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=1!5!2!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=1!5!3!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                                    </tr>
                                    <tr>
                                        <td class="col_180 center borderAll">Cgg</td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=2!5!1!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=2!5!2!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=2!5!3!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                                    </tr>
                                    <tr>
                                        <td class="col_180 center borderAll">Ns</td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=3!5!1!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=3!5!2!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=3!5!3!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                                    </tr>
                                    <tr>
                                        <td class="col_180 center borderAll">NC</td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=4!5!1!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=4!5!2!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=4!5!3!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                                    </tr>
                                    <tr>
                                        <td class="col_180 center borderAll">Co</td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=5!5!1!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=5!5!2!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=5!5!3!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                                    </tr>
                                    <tr>
                                        <td class="col_180 center borderAll">Cps</td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=6!5!1!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=6!5!2!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll">
                                            <a href="javascript: openPopup('popup.aspx?sesja=6!5!3!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                                    </tr>
                                    <tr>
                                        <td class="col_180 center borderAll gray">Razem</td>
                                        <td class="col_180 center borderAll gray">
                                            <a href="javascript: openPopup('popup.aspx?sesja=7!5!1!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll gray">
                                            <a href="javascript: openPopup('popup.aspx?sesja=7!5!2!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                                        <td class="col_180 center borderAll gray">
                                            <a href="javascript: openPopup('popup.aspx?sesja=7!5!3!3')">
                                                <asp:Label CssClass="normal" ID="tab_5_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                                    </tr>
                                </table>

                                <br />
                            </div>

                         
                            
                                <div id="TABELA6" class="page-break">
                                       &nbsp;<asp:Label ID="Label9" runat="server">Skargi na czynność komornika, rep. I Co, symbol 106</asp:Label>
                                &nbsp;<asp:Label ID="infoLabel6" runat="server" Text="tabela 6  \/\/\/" Visible="False"></asp:Label>
                                <br />

                                    
                                    
                                    <table style="width: 99%;">
                                        <tr>
                                            <td class="borderAll center" rowspan="3">Pozostało z r.</td>
                                            <td class="borderAll center" rowspan="3">Wpłynęło w r.</td>
                                            <td class="borderAll center" colspan="5">załatwiono</td>
                                            <td class="borderAll center" rowspan="3">Pozostało</td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center" rowspan="2">ogółem</td>
                                            <td class="borderAll center" colspan="4">w tym</td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center">oddalono</td>
                                            <td class="borderAll center">uwzględniono</td>
                                            <td class="borderAll center">odrzucono</td>
                                            <td class="borderAll center">w inny sposób</td>
                                        </tr>
                                        <tr>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!6!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!6!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!6!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!6!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!6!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!6!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!6!7!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w01_c07" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!6!8!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w01_c08" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!6!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!6!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!6!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!6!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!6!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!6!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!6!7!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w02_c07" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!6!8!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w02_c08" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!6!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!6!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!6!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!6!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!6!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!6!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!6!7!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w03_c07" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!6!8!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w03_c08" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!6!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!6!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!6!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!6!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!6!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!6!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!6!7!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w04_c07" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!6!8!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w04_c08" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!6!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!6!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!6!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!6!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!6!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!6!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!6!7!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w05_c07" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!6!8!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w05_c08" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!6!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!6!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!6!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!6!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!6!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!6!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!6!7!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w06_c07" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_180 center borderAll">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!6!8!3')">
                                                    <asp:Label CssClass="normal" ID="tab_6_w06_c08" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                    </table>

                                    <br />
                                </div>

                                <div class="page-break">
                                    &nbsp;<asp:Label ID="Label13" runat="server">LICZBA WOKAND JAWNYCH</asp:Label>
                                    &nbsp;
           <asp:Label ID="infoLabel7" runat="server" Text="tabela 7  \/\/\/" Visible="False"></asp:Label>
                                    <br />

                                    <asp:GridView ID="gwTabela7" runat="server" OnRowCreated="naglowekTabeli_gwTabela7" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela7" Width="99%" ShowHeader="False" ShowFooter="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label25" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                                    <asp:Label ID="Label26" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="t2_nazwisko" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!7"%>')">
                                                        <asp:Label ID="Label_gwTabela7113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_60 gray" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" />
                                    </asp:GridView>

                                    <br />
                                </div>

                                <div class="page-break">
                                    &nbsp;<asp:Label ID="Label60" runat="server">LICZBA WOKAND NIEJAWNYCH</asp:Label>
                                    &nbsp;<asp:Label ID="infoLabel8" runat="server" Text="tabela 8  \/\/\/" Visible="False"></asp:Label>
                                    <br />
                                    <asp:GridView ID="gwTabela8" runat="server" OnRowCreated="naglowekTabeli_gwTabela8" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela8" Width="99%" ShowHeader="False" ShowFooter="True">
                                        <Columns>

                                            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                                <ItemTemplate>
                                                    <asp:Label ID="nazwisko" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                                    <asp:Label ID="imie" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="t2_nazwisko" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                                        <asp:Label ID="Label23" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                                        <asp:Label ID="Label24" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                                        <asp:Label ID="Label31" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!7"%>')">
                                                        <asp:Label ID="Label33" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="col_80 gray" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" />
                                    </asp:GridView>

                                    <br />
                                </div>

      


                                <div class="page-break">
                                    &nbsp;<asp:Label ID="Label17" runat="server">W załączeniu przedstawiam dane statystyczne dotyczące sędziów funkcyjnych -  Przewodniczącego Wydziału</asp:Label>
                                    &nbsp;<asp:Label ID="infoLabel9" runat="server" Text="tabela 9  \/\/\/" Visible="False"></asp:Label>
                                    <br />
                                    <table style="width: 99%;">
                                        <tr>
                                            <td class="borderAll center">Sędziowie ogółem</td>
                                            <td class="borderAll center">do 1 miesiąca</td>
                                            <td class="borderAll center">pow. 1 do 2 miesięcy</td>
                                            <td class="borderAll center">pow. 2 do 3 miesięcy</td>
                                            <td class="borderAll center">pow.3 do 4 miesięcy</td>
                                            <td class="borderAll center">pow. 4 do 6 miesięcy</td>
                                            <td class="borderAll center">pow.6 do 12 miesięcy </td>
                                            <td class="borderAll center">ponad 12 miesięcy</td>
                                            <td class="borderAll center">RAZEM</td>
                                        </tr>
                                        <tr>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c01" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c02" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c03" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c04" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c05" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c06" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!7!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c07" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!8!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c08" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!9!9!3')">
                                                    <asp:Label CssClass="normal" ID="tab_9_w01_c09" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                        </tr>
                                    </table>

                                    <br />

                                    <br />
                                </div>

                                <div class="page-break">
                                    &nbsp;<asp:Label ID="Label2" runat="server">W załączeniu przedstawiam dane statystyczne dotyczące sędziów funkcyjnych, -  Wiceprezesa  Wydziału</asp:Label>
                                    &nbsp;<asp:Label ID="Label32" runat="server" Text="tabela 10  \/\/\/" Visible="False"></asp:Label>
                                    <br />
                                    <table style="width: 99%;">
                                        <tr>
                                            <td class="borderAll center">Przewodniczący</td>
                                            <td class="borderAll center">Ilość spraw załatwionych na rozprawie</td>
                                            <td class="borderAll center">Ilość spraw załatwionych na posiedzeniach</td>
                                            <td class="borderAll center">Liczba wniosków o uzasadnienie</td>
                                            <td class="borderAll center">Wpływ apelacji</td>
                                            <td class="borderAll center">Rozpoznano</td>
                                            <td class="borderAll center">Utrzymano w mocy</td>
                                            <td class="borderAll center">Uchylono</td>
                                            <td class="borderAll center">Zmieniono</td>
                                            <td class="borderAll center">inne</td>
                                        </tr>
                                        <tr>
                                            <td class="col_140 center borderAll">
                                              Rok
                                            </td>
                                            <td class="col_140 center borderAll">
                                                  <a href="javascript:openPopup('popup.aspx?sesja=1!10!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!10!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c02" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!10!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c03" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!10!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c04" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!10!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c05" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!10!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c06" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!10!7!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c07" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!10!8!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c08" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                            <td class="col_140 center borderAll">
                                                <a href="javascript:openPopup('popup.aspx?sesja=1!10!9!3')">
                                                    <asp:Label CssClass="normal" ID="tab_10_w01_c09" runat="server" Text="0"></asp:Label></a>
                                            </td>
                                        </tr>
                                    </table>

                                    <br />
                                </div>
                                <div class="page-break">
                                    &nbsp;<asp:Label ID="Label21" runat="server">Stabilność orzecznictwa - Apelacje</asp:Label>
                                    &nbsp;<asp:Label ID="infoLabel11" runat="server" Text="tabela 11  \/\/\/" Visible="False"></asp:Label>
                                    <br />
                                    <asp:Label ID="LabelText01" runat="server" Text="Label"></asp:Label>
                                    <br />
                                    <asp:GridView ID="gwTabela11" runat="server" OnRowCreated="naglowekTabeli_gwTabela11" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela11" Width="99%" ShowHeader="False" ShowFooter="True">
                                        <Columns>

                                            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label33" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                                    <asp:Label ID="Label34" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="t2_nazwisko" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                                        <asp:Label ID="Label_gwTabela11101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                                        <asp:Label ID="Label_gwTabela11102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                                        <asp:Label ID="Label_gwTabela11103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                                        <asp:Label ID="Label_gwTabela11104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                                        <asp:Label ID="Label_gwTabela11105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle CssClass="gray" />
                                    </asp:GridView>
                                </div>

                                <br />
                                <div class="page-break">
                                    &nbsp;<asp:Label ID="Label35" runat="server">Stabilność orzecznictwa Zażalenia</asp:Label>
                                    &nbsp;<asp:Label ID="infoLabel12" runat="server" Text="tabela 12  \/\/\/" Visible="False"></asp:Label>
                                    <br />
                                    <asp:Label ID="LabelText02" runat="server" Text="Label"></asp:Label>
                                    <br />
                                    <asp:GridView ID="gwTabela12" runat="server" OnRowCreated="naglowekTabeli_gwTabela12" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela12" Width="99%" ShowHeader="False" ShowFooter="True">
                                        <Columns>

                                            <asp:TemplateField HeaderText="imie" SortExpression="imie">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label37" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                                                    <asp:Label ID="Label38" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="t2_nazwisko" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                                        <asp:Label ID="Label_gwTabela12101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                                        <asp:Label ID="Label_gwTabela12102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                                        <asp:Label ID="Label_gwTabela12103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                                        <asp:Label ID="Label_gwTabela12104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                                                <ItemTemplate>
                                                    <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                                        <asp:Label ID="Label_gwTabela12105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="center BorderAll col_130" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle CssClass="gray" />
                                    </asp:GridView>
                                </div>

                                <div class="page-break">
                                    <br />
                                    <asp:Label ID="Label36" runat="server">Ilość spraw czynnych "zawieszonych"</asp:Label>
                                    &nbsp;<asp:Label ID="infoLabel13" runat="server" Text="tabela 13  \/\/\/" Visible="False"></asp:Label>

                                    <table style="width: 99%;">
                                        <tr>
                                            <td class="borderAll center">Podstawa prawna zawieszenia</td>
                                            <td class="borderAll center">Repertorium C</td>
                                            <td class="borderAll center">Repertorium Ns
                                            </td>
                                            <td class="borderAll center">Repertorium Co</td>
                                            <td class="borderAll center col_200 gray">RAZEM</td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll wciecie ">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!13!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!13!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!13!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!13!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!13!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll wciecie ">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!13!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!13!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!13!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!13!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!13!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll wciecie ">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!13!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!13!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!13!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!13!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!13!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll wciecie ">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!13!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!13!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!13!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!13!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!13!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll wciecie ">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!13!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!13!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!13!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!13!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!13!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll wciecie ">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!13!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!13!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!13!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!13!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!13!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll wciecie ">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!13!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!13!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!13!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!13!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!13!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll wciecie gray">Razem</td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!13!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!13!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!13!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!13!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_13_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                    </table>

                                    <br />
                                </div>
                                <div id="TABELA14" class="page-break">
                                    &nbsp;<asp:Label ID="Label39" runat="server">Ilość wszystkich spraw zawieszonych</asp:Label>
                                    &nbsp;<asp:Label ID="infoLabel14" runat="server" Text="tabela 14  \/\/\/" Visible="False"></asp:Label>

                                    <table style="width: 99%;">
                                        <tr>
                                            <td class="borderAll center">Podstawa prawna zawieszenia</td>
                                            <td class="borderAll center">Repertorium C</td>
                                            <td class="borderAll center">Repertorium Ns
                                            </td>
                                            <td class="borderAll center">Repertorium Co</td>
                                            <td class="borderAll center">Repertorium Nc</td>
                                            <td class="col_200 borderAll center gray">RAZEM</td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!14!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w01_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!14!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!14!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w01_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!14!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w01_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!14!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w01_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_200 borderAll center gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=1!14!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w01_c06" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!14!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!14!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!14!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w02_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!14!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w02_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!14!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w02_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_200 borderAll center gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=2!14!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w02_c06" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!14!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!14!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!14!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w03_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!14!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w03_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!14!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w03_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_200 borderAll center gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=3!14!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w03_c06" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!14!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!14!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!14!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w04_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!14!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w04_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!14!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w04_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_200 borderAll center gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=4!14!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w04_c06" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!14!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!14!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!14!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w05_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!14!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w05_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!14!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w05_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_200 borderAll center gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=5!14!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w05_c06" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!14!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!14!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!14!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w06_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!14!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w06_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!14!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w06_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_200 borderAll center gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=6!14!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w06_c06" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!14!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!14!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!14!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w07_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!14!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w07_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!14!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w07_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_200 borderAll center gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=7!14!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w07_c06" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                        <tr>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!14!1!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!14!2!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!14!3!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w08_c03" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!14!4!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w08_c04" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="borderAll center col_200 gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!14!5!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w08_c05" runat="server" Text="0"></asp:Label></a></td>
                                            <td class="col_200 borderAll center gray">
                                                <a href="javascript: openPopup('popup.aspx?sesja=8!14!6!3')">
                                                    <asp:Label CssClass="normal" ID="tab_14_w08_c06" runat="server" Text="0"></asp:Label></a></td>
                                        </tr>
                                    </table>
                                    <br />
                                </div>
                                <br />
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