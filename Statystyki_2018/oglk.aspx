<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oglk.aspx.cs" Inherits="Statystyki_2018.oglk" %>

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
                margin: 10mm 10mm 10mm 10mm;
            }

            .horizont {
                transform: translate(-15mm, 0) scale(0.9);
                -webkit-transform: translate(-15mm, 0) scale(0.9);
                -moz-transform: translate(-15mm, 0) scale(0.9);
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
                    <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="Odswiez">  Odśwież</asp:LinkButton>
                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 10; position: relative; top: 30px;">
        <br />
        <div class="horizont">
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Informacja statystyczna o ruchu spraw "></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel1" runat="server" Text="tabela  1 + 2 \/\/\/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1" AutoGenerateColumns="False" Width="100%" ShowHeader="False" OnRowDataBound="gwTabela1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle CssClass="col_25" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
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
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!2"%>')">
                                <asp:Label ID="Label_gwTabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!2"%>')">
                                <asp:Label ID="Label_gwTabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!2"%>')">
                                <asp:Label ID="Label_gwTabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!2"%>')">
                                <asp:Label ID="Label_gwTabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!2"%>')">
                                <asp:Label ID="Label_gwTabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!2"%>')">
                                <asp:Label ID="Label_gwTabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!2"%>')">
                                <asp:Label ID="Label_gwTabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 " />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!2"%>')">
                                <asp:Label ID="Label_gwTabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!2"%>')">
                                <asp:Label ID="Label_gwTabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!2"%>')">
                                <asp:Label ID="Label_gwTabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!2"%>')">
                                <asp:Label ID="Label_gwTabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal "></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 " />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!2"%>')">
                                <asp:Label ID="Label_gwTabela1113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal "></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 " />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!2"%>')">
                                <asp:Label ID="Label_gwTabela1114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal "></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 " />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!2"%>')">
                                <asp:Label ID="Label_gwTabela1115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 " />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!2"%>')">
                                <asp:Label ID="Label_gwTabela1116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 " />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!2"%>')">
                                <asp:Label ID="Label_gwTabela1117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 " />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!2"%>')">
                                <asp:Label ID="Label_gwTabela1118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 " />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!2"%>')">
                                <asp:Label ID="Label_gwTabela1119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!2"%>')">
                                <asp:Label ID="Label_gwTabela1120" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!2"%>')">
                                <asp:Label ID="Label_gwTabela1121" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_60 gray" />
                    </asp:TemplateField>
               
                
                  
                </Columns>
            </asp:GridView>
            <br />
              <div id="Div11" class="page-break">
            &nbsp;<asp:Label ID="Label2" runat="server">Ewidencja spraw odroczonych    </asp:Label>
            &nbsp;
    &nbsp;<asp:Label ID="infoLabel4" runat="server" Text="Tabela 4 \/" Visible="False"></asp:Label>
            <br />
            <br />
            <table cellpadding="0" cellspacing="0" class="borderAll" style="width: 100%;">
                <tr>
                    <td class="borderTopLeft" colspan="2">Sprawy według repertoriów/wykazów</td>
                    <td align="center" class="borderTopLeft">Ilość spraw wyznaczonych</td>
                    <td align="center" class="borderTopLeft">Ilość spraw odroczonych</td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Ogółem (suma wierszy 2,7,9) </td>
                    <td class="borderTopLeft col_36">1</td>
                    <td align="center" class="borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>

                    <td align="center" class="borderTopLeft"><a href="javascript:openPopup('popup.aspx?sesja=1!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w01_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Sprawy karne ogółem (suma wierszy 3,4,6,9,10)</td>
                    <td class="borderTopLeft col_36">2</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=2!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w02_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">K</td>
                    <td class="borderTopLeft col_36">3</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=3!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w03_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Ks</td>
                    <td class="borderTopLeft col_36">4</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w04_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=4!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w04_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Kp</td>
                    <td class="borderTopLeft col_36">5</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w05_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=5!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w05_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Ko (suma wierszy 6,7) </td>
                    <td class="borderTopLeft col_36">6</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w06_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=6!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w06_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Ko -sprawy karne</td>
                    <td class="borderTopLeft col_36">7</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w07_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=7!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w07_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Ko - sprawy wykroczeniowe </td>
                    <td class="borderTopLeft col_36">8</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w08_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=8!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w08_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">W</td>
                    <td class="borderTopLeft col_36">9</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w09_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=9!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w09_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Kop</td>
                    <td class="borderTopLeft col_36">10</td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w10_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w10_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
                <tr>
                    <td class="borderTopLeft wciecie">Odpowiedzialność podmiotów zbiorowych </td>
                    <td class="borderTopLeft col_36">&nbsp;</td>
                     <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!4!1!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w11_c01" runat="server" Text="0"></asp:Label></a></td>
                    <td class="borderTopLeft" align="center"><a href="javascript:openPopup('popup.aspx?sesja=10!4!2!3')">
                        <asp:Label CssClass="normal" ID="tab_4_w11_c02" runat="server" Text="0"></asp:Label></a></td>
                </tr>
            </table>
            <br />
        </div>
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