<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aopk2.aspx.cs" Inherits="Statystyki_2018.aopk2" %>

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

            div {
                transform: translate(0, 0);
                -webkit-transform: translate(0, 0 ); /* Saf3.1+, Chrome */
                -moz-transform: translate(0, 0); /* FF3.5+ */
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
                    <td style="width: auto; padding-left: 5px;">&nbsp;</td>
                </td>

                <td style="width: auto; padding-left: 5px;">
                    <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="tworzPlikExcell">Zapisz do Excel</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin: 0 auto 0 auto; position: relative; top: 30px;">
        <div style="margin-left: auto; margin-right: auto; text-align: center; width: auto;">
            <asp:Label ID="LabelNazwaSadu" runat="server" Text="Sąd " Style="font-weight: 700"></asp:Label>
            <br />
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Ruch spraw w referatach sędziów"></asp:Label>
            <br />
            <asp:Label ID="infoLabel1" runat="server" Text="tabela  1" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela1" runat="server" OnRowCreated="naglowekTabeli_gwTabela1" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela1" Width="100%" ShowHeader="False" ShowFooter="True">

                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_160Fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!6"%>')">
                                <asp:Label ID="Label_tabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!6"%>')">
                                <asp:Label ID="Label_tabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!6"%>')">
                                <asp:Label ID="Label_tabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!6"%>')">
                                <asp:Label ID="Label_tabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!6"%>')">
                                <asp:Label ID="Label_tabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!6"%>')">
                                <asp:Label ID="Label_tabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!6"%>')">
                                <asp:Label ID="Label_tabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!6"%>')">
                                <asp:Label ID="Label_tabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!6"%>')">
                                <asp:Label ID="Label_tabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!6"%>')">
                                <asp:Label ID="Label_tabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!6"%>')">
                                <asp:Label ID="Label_tabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!6"%>')">
                                <asp:Label ID="Label_tabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!6"%>')">
                                <asp:Label ID="Label_tabela1113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!6"%>')">
                                <asp:Label ID="Label_tabela1114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!6"%>')">
                                <asp:Label ID="Label_tabela1115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_16" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!6"%>')">
                                <asp:Label ID="Label_tabela1116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_17" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!6"%>')">
                                <asp:Label ID="Label_tabela1117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_18" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!6"%>')">
                                <asp:Label ID="Label_tabela1118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_19" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!6"%>')">
                                <asp:Label ID="Label_tabela1119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_20" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!6"%>')">
                                <asp:Label ID="Label_tabela1120" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_21" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!6"%>')">
                                <asp:Label ID="Label_tabela1121" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_22" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!6"%>')">
                                <asp:Label ID="Label_tabela1122" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_23" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!6"%>')">
                                <asp:Label ID="Label_tabela1123" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_24" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!6"%>')">
                                <asp:Label ID="Label_tabela1124" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_25" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!6"%>')">
                                <asp:Label ID="Label_tabela1125" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_26" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!6"%>')">
                                <asp:Label ID="Label_tabela1126" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_27" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!6"%>')">
                                <asp:Label ID="Label_tabela1127" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_28" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!28!6"%>')">
                                <asp:Label ID="Label_tabela1128" runat="server" Text='<%# Eval("d_28")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_29" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!29!6"%>')">
                                <asp:Label ID="Label_tabela1129" runat="server" Text='<%# Eval("d_29")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_30" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!30!6"%>')">
                                <asp:Label ID="Label_tabela1130" runat="server" Text='<%# Eval("d_30")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_31" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!31!6"%>')">
                                <asp:Label ID="Label_tabela1131" runat="server" Text='<%# Eval("d_31")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_32" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!32!6"%>')">
                                <asp:Label ID="Label_tabela1132" runat="server" Text='<%# Eval("d_32")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_33" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!33!6"%>')">
                                <asp:Label ID="Label_tabela1133" runat="server" Text='<%# Eval("d_33")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_34" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!34!6"%>')">
                                <asp:Label ID="Label_tabela1134" runat="server" Text='<%# Eval("d_34")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_35" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!35!6"%>')">
                                <asp:Label ID="Label_tabela1135" runat="server" Text='<%# Eval("d_35")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_36" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!36!6"%>')">
                                <asp:Label ID="Label_tabela1136" runat="server" Text='<%# Eval("d_36")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_37" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!37!6"%>')">
                                <asp:Label ID="Label_tabela1137" runat="server" Text='<%# Eval("d_37")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_38" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!38!6"%>')">
                                <asp:Label ID="Label_tabela1138" runat="server" Text='<%# Eval("d_38")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_39" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!39!6"%>')">
                                <asp:Label ID="Label_tabela1139" runat="server" Text='<%# Eval("d_39")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_40" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!40!6"%>')">
                                <asp:Label ID="Label_tabela1140" runat="server" Text='<%# Eval("d_40")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_41" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!41!6"%>')">
                                <asp:Label ID="Label_tabela1141" runat="server" Text='<%# Eval("d_41")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_42" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!42!6"%>')">
                                <asp:Label ID="Label_tabela1142" runat="server" Text='<%# Eval("d_42")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_43" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!43!6"%>')">
                                <asp:Label ID="Label_tabela1143" runat="server" Text='<%# Eval("d_43")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_44" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!44!6"%>')">
                                <asp:Label ID="Label_tabela1144" runat="server" Text='<%# Eval("d_44")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_45" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!45!6"%>')">
                                <asp:Label ID="Label_tabela1145" runat="server" Text='<%# Eval("d_45")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_46" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!46!6"%>')">
                                <asp:Label ID="Label_tabela1146" runat="server" Text='<%# Eval("d_46")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_47" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!47!6"%>')">
                                <asp:Label ID="Label_tabela1147" runat="server" Text='<%# Eval("d_47")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_48" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!48!6"%>')">
                                <asp:Label ID="Label_tabela1148" runat="server" Text='<%# Eval("d_48")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_49" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!49!6"%>')">
                                <asp:Label ID="Label_tabela1149" runat="server" Text='<%# Eval("d_49")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_50" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!50!6"%>')">
                                <asp:Label ID="Label_tabela1150" runat="server" Text='<%# Eval("d_50")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_51" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!51!6"%>')">
                                <asp:Label ID="Label_tabela1151" runat="server" Text='<%# Eval("d_51")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_52" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!52!6"%>')">
                                <asp:Label ID="Label_tabela1152" runat="server" Text='<%# Eval("d_52")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_53" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!53!6"%>')">
                                <asp:Label ID="Label_tabela1153" runat="server" Text='<%# Eval("d_53")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_54" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!54!6"%>')">
                                <asp:Label ID="Label_tabela1154" runat="server" Text='<%# Eval("d_54")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_55" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!55!6"%>')">
                                <asp:Label ID="Label_tabela1155" runat="server" Text='<%# Eval("d_55")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_56" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!56!6"%>')">
                                <asp:Label ID="Label_tabela1156" runat="server" Text='<%# Eval("d_56")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_57" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!57!6"%>')">
                                <asp:Label ID="Label_tabela1157" runat="server" Text='<%# Eval("d_57")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_58" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!58!6"%>')">
                                <asp:Label ID="Label_tabela1158" runat="server" Text='<%# Eval("d_58")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_59" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!59!6"%>')">
                                <asp:Label ID="Label_tabela1159" runat="server" Text='<%# Eval("d_59")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_60" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!60!6"%>')">
                                <asp:Label ID="Label_tabela1160" runat="server" Text='<%# Eval("d_60")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_61" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!61!6"%>')">
                                <asp:Label ID="Label_tabela1161" runat="server" Text='<%# Eval("d_61")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_62" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!62!6"%>')">
                                <asp:Label ID="Label_tabela1162" runat="server" Text='<%# Eval("d_62")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_63" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!63!6"%>')">
                                <asp:Label ID="Label_tabela1163" runat="server" Text='<%# Eval("d_63")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_64" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!64!6"%>')">
                                <asp:Label ID="Label_tabela1164" runat="server" Text='<%# Eval("d_64")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_65" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!65!6"%>')">
                                <asp:Label ID="Label_tabela1165" runat="server" Text='<%# Eval("d_65")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_66" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!66!6"%>')">
                                <asp:Label ID="Label_tabela1166" runat="server" Text='<%# Eval("d_66")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_67" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!67!6"%>')">
                                <asp:Label ID="Label_tabela1167" runat="server" Text='<%# Eval("d_67")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_68" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!68!6"%>')">
                                <asp:Label ID="Label_tabela1168" runat="server" Text='<%# Eval("d_68")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_69" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!69!6"%>')">
                                <asp:Label ID="Label_tabela1169" runat="server" Text='<%# Eval("d_69")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_70" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!70!6"%>')">
                                <asp:Label ID="Label_tabela1170" runat="server" Text='<%# Eval("d_70")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_71" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!71!6"%>')">
                                <asp:Label ID="Label_tabela1171" runat="server" Text='<%# Eval("d_71")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_72" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!72!6"%>')">
                                <asp:Label ID="Label_tabela1172" runat="server" Text='<%# Eval("d_72")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_73" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!73!6"%>')">
                                <asp:Label ID="Label_tabela1173" runat="server" Text='<%# Eval("d_73")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_74" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!74!6"%>')">
                                <asp:Label ID="Label_tabela1174" runat="server" Text='<%# Eval("d_74")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_75" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!75!6"%>')">
                                <asp:Label ID="Label_tabela1175" runat="server" Text='<%# Eval("d_75")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_76" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!76!6"%>')">
                                <asp:Label ID="Label_tabela1176" runat="server" Text='<%# Eval("d_76")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_77" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!77!6"%>')">
                                <asp:Label ID="Label_tabela1177" runat="server" Text='<%# Eval("d_77")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_78" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!78!6"%>')">
                                <asp:Label ID="Label_tabela1178" runat="server" Text='<%# Eval("d_78")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                  
                
                </Columns>
                <FooterStyle CssClass="gray" />
            </asp:GridView>
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