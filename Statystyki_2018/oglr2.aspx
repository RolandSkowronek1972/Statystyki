<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="oglr2.aspx.cs" Inherits="Statystyki_2018.oglr2" %>

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
                    transform: translate(-60mm, 0) scale(0.60);
                    -webkit-transform: translate(-60mm, 0) scale(0.60);
                    -moz-transform: translate(-60mm, 0) scale(0.60);
                }
            }
    </style>
    <script src="Scripts/rls.js"></script>
    <div class="noprint">
        <div id="menu" style="background-color: #f7f7f7; z-index: 9999">
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
                            <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" />

                        </td>
                        <td style="width: auto; padding-left: 5px;">
                            <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <div style="width: 1150px; margin: 0 auto 0 auto; position: relative; top: 60px;">

        <div id="Div2" style="z-index: 10;">
            <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
                <asp:Label ID="Label3" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
                <br />
            </div>
        </div>
        <div id="zalatwienia" class="horizont">
            <br />

            <asp:Label ID="tabela2Label" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="infoLabel2" runat="server" Text="Tabela 1\/" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="Tabela1" runat="server" OnRowCreated="naglowekTabeli_Tabela1" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_Tabela1" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_Tabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_Tabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <asp:TextBox ID="Label_Tabela1103" Width="30px" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal center"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <asp:TextBox ID="Label_Tabela1104" Width="30px" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal center"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_Tabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_Tabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_Tabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_Tabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_Tabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_Tabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <asp:TextBox ID="Label_Tabela1111" Width="30px" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal center"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                <asp:Label ID="Label_Tabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!7"%>')">
                                <asp:Label ID="Label_Tabela1113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!7"%>')">
                                <asp:Label ID="Label_Tabela1114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!7"%>')">
                                <asp:Label ID="Label_Tabela1115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_16" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!7"%>')">
                                <asp:Label ID="Label_Tabela1116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_17" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!7"%>')">
                                <asp:Label ID="Label_Tabela1117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_18" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!7"%>')">
                                <asp:Label ID="Label_Tabela1118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_19" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!7"%>')">
                                <asp:Label ID="Label_Tabela1119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_20" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!7"%>')">
                                <asp:Label ID="Label_Tabela1120" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_21" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!7"%>')">
                                <asp:Label ID="Label_Tabela1121" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_22" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!7"%>')">
                                <asp:Label ID="Label_Tabela1122" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_23" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!7"%>')">
                                <asp:Label ID="Label_Tabela1123" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_24" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!7"%>')">
                                <asp:Label ID="Label_Tabela1124" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_25" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!7"%>')">
                                <asp:Label ID="Label_Tabela1125" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_26" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!7"%>')">
                                <asp:Label ID="Label_Tabela1126" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_27" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!7"%>')">
                                <asp:Label ID="Label_Tabela1127" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_28" SortExpression="d_01">
                        <ItemTemplate>
                            <asp:TextBox ID="Label_Tabela1128" Width="30px" runat="server" Text='<%# Eval("d_28")%>' CssClass="normal center"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_29" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!29!7"%>')">
                                <asp:Label ID="Label_Tabela1129" runat="server" Text='<%# Eval("d_29")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_29" SortExpression="d_01">
                        <ItemTemplate>
                            <asp:TextBox ID="Label_Tabela1130" Width="30px" runat="server" Text='<%# Eval("d_30")%>' CssClass="normal center"></asp:TextBox>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_30" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <br />
        </div>
        <div id="wyznaczenia" class="page-break">
            <asp:Label ID="lbTabela2Title" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel3" runat="server" Text="Tabela 2 \/" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="Gridview2" runat="server" AutoGenerateColumns="False" DataSourceID="" Width="100%" ShowHeader="False" ShowFooter="True" OnRowCreated="naglowekTabeli2" OnRowDataBound="stopkaTabeli2">
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
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_Gridview2101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_Gridview2102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_Gridview2103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_Gridview2104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_200" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_Gridview2105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_200" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <br />
            <asp:SqlDataSource ID="tabela_2" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22,d_23, d_24,d_24,d_25,d_26,d_27,d_28,d_29,d_30, sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div id="wyznaczenia0" class="page-break">
            <asp:Label ID="lbTabela3Title" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel4" runat="server" Text="Tabela 3 \/" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="Gridview3" runat="server" AutoGenerateColumns="False" Width="100%" ShowHeader="False" ShowFooter="True" OnRowCreated="naglowekTabela3" OnRowDataBound="Gridview3_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_Gridview3101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_Gridview3102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_Gridview3103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_Gridview3104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_Gridview3104" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_Gridview3106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_Gridview3107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_Gridview3108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_Gridview3109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_Gridview31108" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
        </div>

        <div id="wyznaczenia1" class="page-break">
            <asp:Label ID="lbTabela4Title" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel5" runat="server" Text="Tabela 4 \/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%; border-spacing: 0px; border-collapse: 0;">
                <tr>
                    <td class="borderAll center" colspan="7">Sprawność postępowania międzyinstancyjnego w okresach wskazanych we wstępnej częsci pisma</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="7">Postepowanie międzyinstancyjne</td>
                </tr>
                <tr>
                    <td class="borderAll center" colspan="7">Ilość spraw przedstawionych II instancji (w czasie liczonym od daty orzeczenia)</td>
                </tr>
                <tr>
                    <td class="borderAll center col_200" rowspan="2">ogółem</td>
                    <td class="borderAll center" colspan="2">do 3 miesięcy </td>
                    <td class="borderAll center" colspan="2">od 3 do 5 miesięcy</td>
                    <td class="borderAll center" colspan="2">powyżej 5 miesięcy</td>
                </tr>
                <tr>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                    <td class="borderAll center">ogółem</td>
                    <td class="borderAll center">%</td>
                </tr>
                <tr>
                    <td class="col_160 borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!1!1')">
                            <asp:Label ID="tab_05_w01_c1" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_160 borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!2!1')">
                            <asp:Label ID="tab_05_w01_c2" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_160 borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!3!1')">
                            <asp:Label ID="tab_05_w01_c3" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_160 borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!4!1')">
                            <asp:Label ID="tab_05_w01_c4" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_160 borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!5!1')">
                            <asp:Label ID="tab_05_w01_c5" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_160 borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!6!1')">
                            <asp:Label ID="tab_05_w01_c6" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="col_160 borderAll">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!4!7!1')">
                            <asp:Label ID="tab_05_w01_c7" runat="server" Text="0"></asp:Label></a>
                    </td>
                </tr>
            </table>

            <br />
        </div>

        <div id="wyznaczenia2" class="page-break">
            <asp:Label ID="lbTabela5Title" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel6" runat="server" Text="Tabela 5 \/" Visible="False"></asp:Label>
            <br />
            <table style="width: 100%;">
                <tr>
                    <td class="borderAll center" colspan="3">Sprawy Zawieszone</td>
                </tr>
                <tr>
                    <td class="borderAll col_325">Podstawa prawna zawieszenia </td>
                    <td class="borderAll col_325">Liczba spraw </td>
                    <td class="borderAll col_325">Terminy czynności nadzorczych Przewodniczącego Wydziału </td>
                </tr>
                <tr>
                    <td class="borderAll col_325">art. 445 § 2 k. p. c. </td>
                    <td class="borderAll col_325 center">
                        <a href="javascript:openPopup('popup.aspx?sesja=1!5!1!3')">
                            <asp:Label ID="tab_06_w01_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="borderAll col_325">co 3 miesiące </td>
                </tr>
                <tr>
                    <td class="borderAll col_325">art. 177 § 1 pkt. 6 kpc </td>
                    <td class="borderAll col_325 center">
                        <a href="javascript:openPopup('popup.aspx?sesja=2!5!1!3')">
                            <asp:Label ID="tab_06_w02_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="borderAll col_325">co 3 miesiące </td>
                </tr>
                <tr>
                    <td class="borderAll col_325">art. 177 § 1 pkt. 5 kpc </td>
                    <td class="borderAll col_325 center">
                        <a href="javascript:openPopup('popup.aspx?sesja=3!5!1!3')">
                            <asp:Label ID="tab_06_w03_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="borderAll col_325">co 3 miesiące </td>
                </tr>
                <tr>
                    <td class="borderAll col_325">art. 177 § 1 pkt. 1 i 2 kpc </td>
                    <td class="borderAll col_325 center">
                        <a href="javascript:openPopup('popup.aspx?sesja=4!5!1!3')">
                            <asp:Label ID="tab_06_w04_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="borderAll col_325">co 3 miesiące </td>
                </tr>
                <tr>
                    <td class="borderAll col_325">art. 174 § 1 pkt 1 i 2 kpc </td>
                    <td class="borderAll col_325 center">
                        <a href="javascript:openPopup('popup.aspx?sesja=5!5!1!3')">
                            <asp:Label ID="tab_06_w05_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="borderAll col_325">co 3 miesiące </td>
                </tr>
                <tr>
                    <td class="borderAll col_325">art. 177 § 1 pkt 3 kpc</td>
                    <td class="borderAll col_325 center">
                        <a href="javascript:openPopup('popup.aspx?sesja=6!5!1!3')">
                            <asp:Label ID="tab_06_w06_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="borderAll col_325">kal. 1 rok</td>
                </tr>
                <tr>
                    <td class="borderAll col_325">Razem</td>
                    <td class="borderAll col_325 center">
                        <a href="javascript:openPopup('popup.aspx?sesja=7!5!1!3')">
                            <asp:Label ID="tab_06_w07_c01" runat="server" Text="0"></asp:Label></a>
                    </td>
                    <td class="borderAll col_325">&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
        </div>

        <div id="wyznaczenia3" class="page-break">
            <asp:Label ID="lbTabela6Title" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel7" runat="server" Text="Tabela 6 \/" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="Gridview6" runat="server" AutoGenerateColumns="False" Width="100%" ShowHeader="False" ShowFooter="True" OnRowCreated="NaglowekTabela7" OnRowDataBound="Gridview6_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_Gridview7101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_Gridview7102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_Gridview7103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_Gridview7104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_Gridview7105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_Gridview7106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_Gridview7107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_Gridview7108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_Gridview7109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_Gridview7110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_Gridview7111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                <asp:Label ID="Label_Gridview7112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!7"%>')">
                                <asp:Label ID="Label_Gridview7113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!7"%>')">
                                <asp:Label ID="Label_Gridview7114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!7"%>')">
                                <asp:Label ID="Label_Gridview7115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_16" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!7"%>')">
                                <asp:Label ID="Label_Gridview7116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
        </div>

        <div id="wyznaczenia4" class="page-break">
            <asp:Label ID="lbTabela7Title" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel8" runat="server" Text="Tabela 7 \/" Visible="False"></asp:Label>
            <br />
            <asp:GridView ID="Gridview7" runat="server" AutoGenerateColumns="False" Width="100%" ShowHeader="False" ShowFooter="True" OnRowCreated="naglowekTabeli8" OnRowDataBound="stopkaTabeli8">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="t2_nazwisko" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_Gridview8101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_Gridview8102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_Gridview8103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_Gridview8104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_Gridview8105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_Gridview8106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_Gridview8107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_90" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="tabela_7" runat="server"
                ConnectionString="<%$ ConnectionStrings:wap %>"
                SelectCommand="SELECT ROW_NUMBER() OVER( ORDER BY ident ) AS id,  ident, imie, nazwisko, funkcja, stanowisko, d_01, d_02, d_03, d_04, d_05, d_06, d_07, d_08, d_09, d_10, d_11, d_12, d_13, d_14, d_15, d_16, d_17, d_18, d_19, d_20, d_21, d_22,d_23, d_24,d_24,d_25,d_26,d_27,d_28,d_29,d_30,d_31,d_32,d_33,d_34 sesja, id_sedziego, id_dzialu, id_tabeli FROM tbl_statystyki_tbl_02 WHERE (id_tabeli = 3) AND (id_dzialu = @id_dzialu) ORDER BY id">
                <SelectParameters>
                    <asp:SessionParameter Name="id_dzialu" SessionField="id_dzialu" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>

        <div id="debag">
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