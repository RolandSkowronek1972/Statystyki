<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aopp.aspx.cs" Inherits="Statystyki_2018.aopp" %>

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
        </div>

        <br />
        <div>
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Ruch spraw w referatach sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;
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
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_tabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_tabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_tabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_tabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_tabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_tabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_tabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_tabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_tabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_tabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_tabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                <asp:Label ID="Label_tabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!7"%>')">
                                <asp:Label ID="Label_tabela1113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!7"%>')">
                                <asp:Label ID="Label_tabela1114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!7"%>')">
                                <asp:Label ID="Label_tabela1115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_16" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!7"%>')">
                                <asp:Label ID="Label_tabela1116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_17" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!7"%>')">
                                <asp:Label ID="Label_tabela1117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_18" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!7"%>')">
                                <asp:Label ID="Label_tabela1118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_19" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!7"%>')">
                                <asp:Label ID="Label_tabela1119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_20" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!7"%>')">
                                <asp:Label ID="Label_tabela1120" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_21" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!7"%>')">
                                <asp:Label ID="Label_tabela1121" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_22" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!7"%>')">
                                <asp:Label ID="Label_tabela1122" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_23" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!7"%>')">
                                <asp:Label ID="Label_tabela1123" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_24" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!7"%>')">
                                <asp:Label ID="Label_tabela1124" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_25" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!7"%>')">
                                <asp:Label ID="Label_tabela1125" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_26" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!7"%>')">
                                <asp:Label ID="Label_tabela1126" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_27" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!7"%>')">
                                <asp:Label ID="Label_tabela1127" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_28" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!28!7"%>')">
                                <asp:Label ID="Label_tabela1128" runat="server" Text='<%# Eval("d_28")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_29" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!29!7"%>')">
                                <asp:Label ID="Label_tabela1129" runat="server" Text='<%# Eval("d_29")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_30" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!30!7"%>')">
                                <asp:Label ID="Label_tabela1130" runat="server" Text='<%# Eval("d_30")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_31" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!31!7"%>')">
                                <asp:Label ID="Label_tabela1131" runat="server" Text='<%# Eval("d_31")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_32" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!32!7"%>')">
                                <asp:Label ID="Label_tabela1132" runat="server" Text='<%# Eval("d_32")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_33" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!33!7"%>')">
                                <asp:Label ID="Label_tabela1133" runat="server" Text='<%# Eval("d_33")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_34" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!34!7"%>')">
                                <asp:Label ID="Label_tabela1134" runat="server" Text='<%# Eval("d_34")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_35" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!35!7"%>')">
                                <asp:Label ID="Label_tabela1135" runat="server" Text='<%# Eval("d_35")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_36" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!36!7"%>')">
                                <asp:Label ID="Label_tabela1136" runat="server" Text='<%# Eval("d_36")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_37" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!37!7"%>')">
                                <asp:Label ID="Label_tabela1137" runat="server" Text='<%# Eval("d_37")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_38" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!38!7"%>')">
                                <asp:Label ID="Label_tabela1138" runat="server" Text='<%# Eval("d_38")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_39" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!39!7"%>')">
                                <asp:Label ID="Label_tabela1139" runat="server" Text='<%# Eval("d_39")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_40" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!40!7"%>')">
                                <asp:Label ID="Label_tabela1140" runat="server" Text='<%# Eval("d_40")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_41" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!41!7"%>')">
                                <asp:Label ID="Label_tabela1141" runat="server" Text='<%# Eval("d_41")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_42" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!42!7"%>')">
                                <asp:Label ID="Label_tabela1142" runat="server" Text='<%# Eval("d_42")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_43" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!43!7"%>')">
                                <asp:Label ID="Label_tabela1143" runat="server" Text='<%# Eval("d_43")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_44" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!44!7"%>')">
                                <asp:Label ID="Label_tabela1144" runat="server" Text='<%# Eval("d_44")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_45" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!45!7"%>')">
                                <asp:Label ID="Label_tabela1145" runat="server" Text='<%# Eval("d_45")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_46" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!46!7"%>')">
                                <asp:Label ID="Label_tabela1146" runat="server" Text='<%# Eval("d_46")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_47" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!47!7"%>')">
                                <asp:Label ID="Label_tabela1147" runat="server" Text='<%# Eval("d_47")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_48" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!48!7"%>')">
                                <asp:Label ID="Label_tabela1148" runat="server" Text='<%# Eval("d_48")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_49" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!49!7"%>')">
                                <asp:Label ID="Label_tabela1149" runat="server" Text='<%# Eval("d_49")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_50" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!50!7"%>')">
                                <asp:Label ID="Label_tabela1150" runat="server" Text='<%# Eval("d_50")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_51" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!51!7"%>')">
                                <asp:Label ID="Label_tabela1151" runat="server" Text='<%# Eval("d_51")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_52" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!52!7"%>')">
                                <asp:Label ID="Label_tabela1152" runat="server" Text='<%# Eval("d_52")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_53" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!53!7"%>')">
                                <asp:Label ID="Label_tabela1153" runat="server" Text='<%# Eval("d_53")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_54" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!54!7"%>')">
                                <asp:Label ID="Label_tabela1154" runat="server" Text='<%# Eval("d_54")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_55" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!55!7"%>')">
                                <asp:Label ID="Label_tabela1155" runat="server" Text='<%# Eval("d_55")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_56" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!56!7"%>')">
                                <asp:Label ID="Label_tabela1156" runat="server" Text='<%# Eval("d_56")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_57" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!57!7"%>')">
                                <asp:Label ID="Label_tabela1157" runat="server" Text='<%# Eval("d_57")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_58" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!58!7"%>')">
                                <asp:Label ID="Label_tabela1158" runat="server" Text='<%# Eval("d_58")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_59" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!59!7"%>')">
                                <asp:Label ID="Label_tabela1159" runat="server" Text='<%# Eval("d_59")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_60" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!60!7"%>')">
                                <asp:Label ID="Label_tabela1160" runat="server" Text='<%# Eval("d_60")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_61" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!61!7"%>')">
                                <asp:Label ID="Label_tabela1161" runat="server" Text='<%# Eval("d_61")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_62" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!62!7"%>')">
                                <asp:Label ID="Label_tabela1162" runat="server" Text='<%# Eval("d_62")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_63" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!63!7"%>')">
                                <asp:Label ID="Label_tabela1163" runat="server" Text='<%# Eval("d_63")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_64" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!64!7"%>')">
                                <asp:Label ID="Label_tabela1164" runat="server" Text='<%# Eval("d_64")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_65" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!65!7"%>')">
                                <asp:Label ID="Label_tabela1165" runat="server" Text='<%# Eval("d_65")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_66" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!66!7"%>')">
                                <asp:Label ID="Label_tabela1166" runat="server" Text='<%# Eval("d_66")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_67" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!67!7"%>')">
                                <asp:Label ID="Label_tabela1167" runat="server" Text='<%# Eval("d_67")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_68" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!68!7"%>')">
                                <asp:Label ID="Label_tabela1168" runat="server" Text='<%# Eval("d_68")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_69" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!69!7"%>')">
                                <asp:Label ID="Label_tabela1169" runat="server" Text='<%# Eval("d_69")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_70" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!70!7"%>')">
                                <asp:Label ID="Label_tabela1170" runat="server" Text='<%# Eval("d_70")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_71" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!71!7"%>')">
                                <asp:Label ID="Label_tabela1171" runat="server" Text='<%# Eval("d_71")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_72" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!72!7"%>')">
                                <asp:Label ID="Label_tabela1172" runat="server" Text='<%# Eval("d_72")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_73" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!73!7"%>')">
                                <asp:Label ID="Label_tabela1173" runat="server" Text='<%# Eval("d_73")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_74" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!74!7"%>')">
                                <asp:Label ID="Label_tabela1174" runat="server" Text='<%# Eval("d_74")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_75" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!75!7"%>')">
                                <asp:Label ID="Label_tabela1175" runat="server" Text='<%# Eval("d_75")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_76" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!76!7"%>')">
                                <asp:Label ID="Label_tabela1176" runat="server" Text='<%# Eval("d_76")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_77" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!77!7"%>')">
                                <asp:Label ID="Label_tabela1177" runat="server" Text='<%# Eval("d_77")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_78" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!78!7"%>')">
                                <asp:Label ID="Label_tabela1178" runat="server" Text='<%# Eval("d_78")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_79" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!79!7"%>')">
                                <asp:Label ID="Label_tabela1179" runat="server" Text='<%# Eval("d_79")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_80" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!80!7"%>')">
                                <asp:Label ID="Label_tabela1180" runat="server" Text='<%# Eval("d_80")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_81" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!81!7"%>')">
                                <asp:Label ID="Label_tabela1181" runat="server" Text='<%# Eval("d_81")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_82" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!82!7"%>')">
                                <asp:Label ID="Label_tabela1182" runat="server" Text='<%# Eval("d_82")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_83" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!83!7"%>')">
                                <asp:Label ID="Label_tabela1183" runat="server" Text='<%# Eval("d_83")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_84" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!84!7"%>')">
                                <asp:Label ID="Label_tabela1184" runat="server" Text='<%# Eval("d_84")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_85" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!85!7"%>')">
                                <asp:Label ID="Label_tabela1185" runat="server" Text='<%# Eval("d_85")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_86" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!86!7"%>')">
                                <asp:Label ID="Label_tabela1186" runat="server" Text='<%# Eval("d_86")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_87" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!87!7"%>')">
                                <asp:Label ID="Label_tabela1187" runat="server" Text='<%# Eval("d_87")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_88" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!88!7"%>')">
                                <asp:Label ID="Label_tabela1188" runat="server" Text='<%# Eval("d_88")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_89" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!89!7"%>')">
                                <asp:Label ID="Label_tabela1189" runat="server" Text='<%# Eval("d_89")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_90" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!90!7"%>')">
                                <asp:Label ID="Label_tabela1190" runat="server" Text='<%# Eval("d_90")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_91" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!91!7"%>')">
                                <asp:Label ID="Label_tabela1191" runat="server" Text='<%# Eval("d_91")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_92" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!92!7"%>')">
                                <asp:Label ID="Label_tabela1192" runat="server" Text='<%# Eval("d_92")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_93" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!93!7"%>')">
                                <asp:Label ID="Label_tabela1193" runat="server" Text='<%# Eval("d_93")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_94" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!94!7"%>')">
                                <asp:Label ID="Label_tabela1194" runat="server" Text='<%# Eval("d_94")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_95" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!95!7"%>')">
                                <asp:Label ID="Label_tabela1195" runat="server" Text='<%# Eval("d_95")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_96" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!96!7"%>')">
                                <asp:Label ID="Label_tabela1196" runat="server" Text='<%# Eval("d_96")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_97" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!97!7"%>')">
                                <asp:Label ID="Label_tabela1197" runat="server" Text='<%# Eval("d_97")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_98" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!98!7"%>')">
                                <asp:Label ID="Label_tabela1198" runat="server" Text='<%# Eval("d_98")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_99" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!99!7"%>')">
                                <asp:Label ID="Label_tabela1199" runat="server" Text='<%# Eval("d_99")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_100" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!100!7"%>')">
                                <asp:Label ID="Label_tabela1200" runat="server" Text='<%# Eval("d_100")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_101" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!101!7"%>')">
                                <asp:Label ID="Label_tabela1201" runat="server" Text='<%# Eval("d_101")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_102" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!102!7"%>')">
                                <asp:Label ID="Label_tabela1202" runat="server" Text='<%# Eval("d_102")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_103" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!103!7"%>')">
                                <asp:Label ID="Label_tabela1203" runat="server" Text='<%# Eval("d_103")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_104" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!104!7"%>')">
                                <asp:Label ID="Label_tabela1204" runat="server" Text='<%# Eval("d_104")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!105!7"%>')">
                                <asp:Label ID="Label_tabela1205" runat="server" Text='<%# Eval("d_105")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_106" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!106!7"%>')">
                                <asp:Label ID="Label_tabela1206" runat="server" Text='<%# Eval("d_106")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_107" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!107!7"%>')">
                                <asp:Label ID="Label_tabela1207" runat="server" Text='<%# Eval("d_107")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_108" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!108!7"%>')">
                                <asp:Label ID="Label_tabela1208" runat="server" Text='<%# Eval("d_108")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_109" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!109!7"%>')">
                                <asp:Label ID="Label_tabela1209" runat="server" Text='<%# Eval("d_109")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_110" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!110!7"%>')">
                                <asp:Label ID="Label_tabela1210" runat="server" Text='<%# Eval("d_110")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_111" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!111!7"%>')">
                                <asp:Label ID="Label_tabela1211" runat="server" Text='<%# Eval("d_111")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_112" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!112!7"%>')">
                                <asp:Label ID="Label_tabela1212" runat="server" Text='<%# Eval("d_112")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_113" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!113!7"%>')">
                                <asp:Label ID="Label_tabela1213" runat="server" Text='<%# Eval("d_113")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_114" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!114!7"%>')">
                                <asp:Label ID="Label_tabela1214" runat="server" Text='<%# Eval("d_114")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_115" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!115!7"%>')">
                                <asp:Label ID="Label_tabela1215" runat="server" Text='<%# Eval("d_115")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_116" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!116!7"%>')">
                                <asp:Label ID="Label_tabela1216" runat="server" Text='<%# Eval("d_116")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_117" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!117!7"%>')">
                                <asp:Label ID="Label_tabela1217" runat="server" Text='<%# Eval("d_117")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_118" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!118!7"%>')">
                                <asp:Label ID="Label_tabela1218" runat="server" Text='<%# Eval("d_118")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_119" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!119!7"%>')">
                                <asp:Label ID="Label_tabela1219" runat="server" Text='<%# Eval("d_119")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_120" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!120!7"%>')">
                                <asp:Label ID="Label_tabela1220" runat="server" Text='<%# Eval("d_120")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_121" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!121!7"%>')">
                                <asp:Label ID="Label_tabela1221" runat="server" Text='<%# Eval("d_121")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_122" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!122!7"%>')">
                                <asp:Label ID="Label_tabela1222" runat="server" Text='<%# Eval("d_122")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_123" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!123!7"%>')">
                                <asp:Label ID="Label_tabela1223" runat="server" Text='<%# Eval("d_123")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_124" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!124!7"%>')">
                                <asp:Label ID="Label_tabela1224" runat="server" Text='<%# Eval("d_124")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_125" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!125!7"%>')">
                                <asp:Label ID="Label_tabela1225" runat="server" Text='<%# Eval("d_125")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_126" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!126!7"%>')">
                                <asp:Label ID="Label_tabela1226" runat="server" Text='<%# Eval("d_126")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_127" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!127!7"%>')">
                                <asp:Label ID="Label_tabela1227" runat="server" Text='<%# Eval("d_127")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_128" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!128!7"%>')">
                                <asp:Label ID="Label_tabela1228" runat="server" Text='<%# Eval("d_128")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_129" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!129!7"%>')">
                                <asp:Label ID="Label_tabela1229" runat="server" Text='<%# Eval("d_129")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_130" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!130!7"%>')">
                                <asp:Label ID="Label_tabela1230" runat="server" Text='<%# Eval("d_130")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_131" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!131!7"%>')">
                                <asp:Label ID="Label_tabela1231" runat="server" Text='<%# Eval("d_131")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_132" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!132!7"%>')">
                                <asp:Label ID="Label_tabela1232" runat="server" Text='<%# Eval("d_132")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_133" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!133!7"%>')">
                                <asp:Label ID="Label_tabela1233" runat="server" Text='<%# Eval("d_133")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_134" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!134!7"%>')">
                                <asp:Label ID="Label_tabela1234" runat="server" Text='<%# Eval("d_134")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_135" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!135!7"%>')">
                                <asp:Label ID="Label_tabela1235" runat="server" Text='<%# Eval("d_135")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_136" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!136!7"%>')">
                                <asp:Label ID="Label_tabela1236" runat="server" Text='<%# Eval("d_136")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_137" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!137!7"%>')">
                                <asp:Label ID="Label_tabela1237" runat="server" Text='<%# Eval("d_137")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_138" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!138!7"%>')">
                                <asp:Label ID="Label_tabela1238" runat="server" Text='<%# Eval("d_138")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_139" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!139!7"%>')">
                                <asp:Label ID="Label_tabela1239" runat="server" Text='<%# Eval("d_139")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_140" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!140!7"%>')">
                                <asp:Label ID="Label_tabela1240" runat="server" Text='<%# Eval("d_140")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_141" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!141!7"%>')">
                                <asp:Label ID="Label_tabela1241" runat="server" Text='<%# Eval("d_141")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_142" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!142!7"%>')">
                                <asp:Label ID="Label_tabela1242" runat="server" Text='<%# Eval("d_142")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_143" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!143!7"%>')">
                                <asp:Label ID="Label_tabela1243" runat="server" Text='<%# Eval("d_143")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_144" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!144!7"%>')">
                                <asp:Label ID="Label_tabela1244" runat="server" Text='<%# Eval("d_144")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_145" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!145!7"%>')">
                                <asp:Label ID="Label_tabela1245" runat="server" Text='<%# Eval("d_145")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_146" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!146!7"%>')">
                                <asp:Label ID="Label_tabela1246" runat="server" Text='<%# Eval("d_146")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_147" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!147!7"%>')">
                                <asp:Label ID="Label_tabela1247" runat="server" Text='<%# Eval("d_147")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_148" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!148!7"%>')">
                                <asp:Label ID="Label_tabela1248" runat="server" Text='<%# Eval("d_148")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_149" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!149!7"%>')">
                                <asp:Label ID="Label_tabela1249" runat="server" Text='<%# Eval("d_149")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_150" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!150!7"%>')">
                                <asp:Label ID="Label_tabela1250" runat="server" Text='<%# Eval("d_150")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_151" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!151!7"%>')">
                                <asp:Label ID="Label_tabela1251" runat="server" Text='<%# Eval("d_151")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_152" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!152!7"%>')">
                                <asp:Label ID="Label_tabela1252" runat="server" Text='<%# Eval("d_152")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_153" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!153!7"%>')">
                                <asp:Label ID="Label_tabela1253" runat="server" Text='<%# Eval("d_153")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_154" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!154!7"%>')">
                                <asp:Label ID="Label_tabela1254" runat="server" Text='<%# Eval("d_154")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_155" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!155!7"%>')">
                                <asp:Label ID="Label_tabela1255" runat="server" Text='<%# Eval("d_155")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_156" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!156!7"%>')">
                                <asp:Label ID="Label_tabela1256" runat="server" Text='<%# Eval("d_156")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_157" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!157!7"%>')">
                                <asp:Label ID="Label_tabela1257" runat="server" Text='<%# Eval("d_157")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_158" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!158!7"%>')">
                                <asp:Label ID="Label_tabela1258" runat="server" Text='<%# Eval("d_158")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_159" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!159!7"%>')">
                                <asp:Label ID="Label_tabela1259" runat="server" Text='<%# Eval("d_159")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_160" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!160!7"%>')">
                                <asp:Label ID="Label_tabela1260" runat="server" Text='<%# Eval("d_160")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_161" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!161!7"%>')">
                                <asp:Label ID="Label_tabela1261" runat="server" Text='<%# Eval("d_161")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_162" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!162!7"%>')">
                                <asp:Label ID="Label_tabela1262" runat="server" Text='<%# Eval("d_162")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_163" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!163!7"%>')">
                                <asp:Label ID="Label_tabela1263" runat="server" Text='<%# Eval("d_163")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_164" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!164!7"%>')">
                                <asp:Label ID="Label_tabela1264" runat="server" Text='<%# Eval("d_164")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_165" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!165!7"%>')">
                                <asp:Label ID="Label_tabela1265" runat="server" Text='<%# Eval("d_165")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_166" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!166!7"%>')">
                                <asp:Label ID="Label_tabela1266" runat="server" Text='<%# Eval("d_166")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_167" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!167!7"%>')">
                                <asp:Label ID="Label_tabela1267" runat="server" Text='<%# Eval("d_167")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_168" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!168!7"%>')">
                                <asp:Label ID="Label_tabela1268" runat="server" Text='<%# Eval("d_168")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_169" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!169!7"%>')">
                                <asp:Label ID="Label_tabela1269" runat="server" Text='<%# Eval("d_169")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_170" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!170!7"%>')">
                                <asp:Label ID="Label_tabela1270" runat="server" Text='<%# Eval("d_170")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_171" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!171!7"%>')">
                                <asp:Label ID="Label_tabela1271" runat="server" Text='<%# Eval("d_171")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_172" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!172!7"%>')">
                                <asp:Label ID="Label_tabela1272" runat="server" Text='<%# Eval("d_172")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_173" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!173!7"%>')">
                                <asp:Label ID="Label_tabela1273" runat="server" Text='<%# Eval("d_173")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_174" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!174!7"%>')">
                                <asp:Label ID="Label_tabela1274" runat="server" Text='<%# Eval("d_174")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_175" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!175!7"%>')">
                                <asp:Label ID="Label_tabela1275" runat="server" Text='<%# Eval("d_175")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_176" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!176!7"%>')">
                                <asp:Label ID="Label_tabela1276" runat="server" Text='<%# Eval("d_176")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_177" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!177!7"%>')">
                                <asp:Label ID="Label_tabela1277" runat="server" Text='<%# Eval("d_177")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_178" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!178!7"%>')">
                                <asp:Label ID="Label_tabela1278" runat="server" Text='<%# Eval("d_178")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_179" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!179!7"%>')">
                                <asp:Label ID="Label_tabela1279" runat="server" Text='<%# Eval("d_179")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_180" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!180!7"%>')">
                                <asp:Label ID="Label_tabela1280" runat="server" Text='<%# Eval("d_180")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_181" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!181!7"%>')">
                                <asp:Label ID="Label_tabela1281" runat="server" Text='<%# Eval("d_181")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_182" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!182!7"%>')">
                                <asp:Label ID="Label_tabela1282" runat="server" Text='<%# Eval("d_182")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_183" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!183!7"%>')">
                                <asp:Label ID="Label_tabela1283" runat="server" Text='<%# Eval("d_183")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_184" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!184!7"%>')">
                                <asp:Label ID="Label_tabela1284" runat="server" Text='<%# Eval("d_184")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_185" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!185!7"%>')">
                                <asp:Label ID="Label_tabela1285" runat="server" Text='<%# Eval("d_185")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_186" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!186!7"%>')">
                                <asp:Label ID="Label_tabela1286" runat="server" Text='<%# Eval("d_186")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_187" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!187!7"%>')">
                                <asp:Label ID="Label_tabela1287" runat="server" Text='<%# Eval("d_187")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_188" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!188!7"%>')">
                                <asp:Label ID="Label_tabela1288" runat="server" Text='<%# Eval("d_188")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_189" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!189!7"%>')">
                                <asp:Label ID="Label_tabela1289" runat="server" Text='<%# Eval("d_189")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_190" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!190!7"%>')">
                                <asp:Label ID="Label_tabela1290" runat="server" Text='<%# Eval("d_190")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_191" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!191!7"%>')">
                                <asp:Label ID="Label_tabela1291" runat="server" Text='<%# Eval("d_191")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_192" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!192!7"%>')">
                                <asp:Label ID="Label_tabela1292" runat="server" Text='<%# Eval("d_192")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_193" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!193!7"%>')">
                                <asp:Label ID="Label_tabela1293" runat="server" Text='<%# Eval("d_193")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_194" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!194!7"%>')">
                                <asp:Label ID="Label_tabela1294" runat="server" Text='<%# Eval("d_194")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_195" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!195!7"%>')">
                                <asp:Label ID="Label_tabela1295" runat="server" Text='<%# Eval("d_195")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_196" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!196!7"%>')">
                                <asp:Label ID="Label_tabela1296" runat="server" Text='<%# Eval("d_196")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_197" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!197!7"%>')">
                                <asp:Label ID="Label_tabela1297" runat="server" Text='<%# Eval("d_197")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_198" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!198!7"%>')">
                                <asp:Label ID="Label_tabela1298" runat="server" Text='<%# Eval("d_198")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_199" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!199!7"%>')">
                                <asp:Label ID="Label_tabela1299" runat="server" Text='<%# Eval("d_199")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_200" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!200!7"%>')">
                                <asp:Label ID="Label_tabela1300" runat="server" Text='<%# Eval("d_200")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_201" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!201!7"%>')">
                                <asp:Label ID="Label_tabela1301" runat="server" Text='<%# Eval("d_201")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_202" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!202!7"%>')">
                                <asp:Label ID="Label_tabela1302" runat="server" Text='<%# Eval("d_202")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_203" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!203!7"%>')">
                                <asp:Label ID="Label_tabela1303" runat="server" Text='<%# Eval("d_203")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_204" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!204!7"%>')">
                                <asp:Label ID="Label_tabela1304" runat="server" Text='<%# Eval("d_204")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_205" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!205!7"%>')">
                                <asp:Label ID="Label_tabela1305" runat="server" Text='<%# Eval("d_205")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_206" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!206!7"%>')">
                                <asp:Label ID="Label_tabela1306" runat="server" Text='<%# Eval("d_206")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_207" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!207!7"%>')">
                                <asp:Label ID="Label_tabela1307" runat="server" Text='<%# Eval("d_207")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_208" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!208!7"%>')">
                                <asp:Label ID="Label_tabela1308" runat="server" Text='<%# Eval("d_208")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_209" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!209!7"%>')">
                                <asp:Label ID="Label_tabela1309" runat="server" Text='<%# Eval("d_209")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_210" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!210!7"%>')">
                                <asp:Label ID="Label_tabela1310" runat="server" Text='<%# Eval("d_210")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_211" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!211!7"%>')">
                                <asp:Label ID="Label_tabela1311" runat="server" Text='<%# Eval("d_211")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_212" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!212!7"%>')">
                                <asp:Label ID="Label_tabela1312" runat="server" Text='<%# Eval("d_212")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_213" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!213!7"%>')">
                                <asp:Label ID="Label_tabela1313" runat="server" Text='<%# Eval("d_213")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_214" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!214!7"%>')">
                                <asp:Label ID="Label_tabela1314" runat="server" Text='<%# Eval("d_214")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_215" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!215!7"%>')">
                                <asp:Label ID="Label_tabela1315" runat="server" Text='<%# Eval("d_215")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_216" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!216!7"%>')">
                                <asp:Label ID="Label_tabela1316" runat="server" Text='<%# Eval("d_216")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_217" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!217!7"%>')">
                                <asp:Label ID="Label_tabela1317" runat="server" Text='<%# Eval("d_217")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_218" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!218!7"%>')">
                                <asp:Label ID="Label_tabela1318" runat="server" Text='<%# Eval("d_218")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_219" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!219!7"%>')">
                                <asp:Label ID="Label_tabela1319" runat="server" Text='<%# Eval("d_219")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_220" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!220!7"%>')">
                                <asp:Label ID="Label_tabela1320" runat="server" Text='<%# Eval("d_220")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_221" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!221!7"%>')">
                                <asp:Label ID="Label_tabela1321" runat="server" Text='<%# Eval("d_221")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_222" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!222!7"%>')">
                                <asp:Label ID="Label_tabela1322" runat="server" Text='<%# Eval("d_222")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_223" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!223!7"%>')">
                                <asp:Label ID="Label_tabela1323" runat="server" Text='<%# Eval("d_223")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_224" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!224!7"%>')">
                                <asp:Label ID="Label_tabela1324" runat="server" Text='<%# Eval("d_224")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_225" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!225!7"%>')">
                                <asp:Label ID="Label_tabela1325" runat="server" Text='<%# Eval("d_225")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_226" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!226!7"%>')">
                                <asp:Label ID="Label_tabela1326" runat="server" Text='<%# Eval("d_226")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_227" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!227!7"%>')">
                                <asp:Label ID="Label_tabela1327" runat="server" Text='<%# Eval("d_227")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_228" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!228!7"%>')">
                                <asp:Label ID="Label_tabela1328" runat="server" Text='<%# Eval("d_228")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_229" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!229!7"%>')">
                                <asp:Label ID="Label_tabela1329" runat="server" Text='<%# Eval("d_229")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_230" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!230!7"%>')">
                                <asp:Label ID="Label_tabela1330" runat="server" Text='<%# Eval("d_230")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_231" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!231!7"%>')">
                                <asp:Label ID="Label_tabela1331" runat="server" Text='<%# Eval("d_231")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_232" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!232!7"%>')">
                                <asp:Label ID="Label_tabela1332" runat="server" Text='<%# Eval("d_232")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_233" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!233!7"%>')">
                                <asp:Label ID="Label_tabela1333" runat="server" Text='<%# Eval("d_233")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_234" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!234!7"%>')">
                                <asp:Label ID="Label_tabela1334" runat="server" Text='<%# Eval("d_234")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_235" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!235!7"%>')">
                                <asp:Label ID="Label_tabela1335" runat="server" Text='<%# Eval("d_235")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_236" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!236!7"%>')">
                                <asp:Label ID="Label_tabela1336" runat="server" Text='<%# Eval("d_236")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_237" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!237!7"%>')">
                                <asp:Label ID="Label_tabela1337" runat="server" Text='<%# Eval("d_237")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_238" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!238!7"%>')">
                                <asp:Label ID="Label_tabela1338" runat="server" Text='<%# Eval("d_238")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_239" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!239!7"%>')">
                                <asp:Label ID="Label_tabela1339" runat="server" Text='<%# Eval("d_239")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_240" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!240!7"%>')">
                                <asp:Label ID="Label_tabela1340" runat="server" Text='<%# Eval("d_240")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_241" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!241!7"%>')">
                                <asp:Label ID="Label_tabela1341" runat="server" Text='<%# Eval("d_241")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_242" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!242!7"%>')">
                                <asp:Label ID="Label_tabela1342" runat="server" Text='<%# Eval("d_242")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_243" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!243!7"%>')">
                                <asp:Label ID="Label_tabela1343" runat="server" Text='<%# Eval("d_243")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_244" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!244!7"%>')">
                                <asp:Label ID="Label_tabela1344" runat="server" Text='<%# Eval("d_244")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_245" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!245!7"%>')">
                                <asp:Label ID="Label_tabela1345" runat="server" Text='<%# Eval("d_245")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_246" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!246!7"%>')">
                                <asp:Label ID="Label_tabela1346" runat="server" Text='<%# Eval("d_246")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_247" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!247!7"%>')">
                                <asp:Label ID="Label_tabela1347" runat="server" Text='<%# Eval("d_247")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_248" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!248!7"%>')">
                                <asp:Label ID="Label_tabela1348" runat="server" Text='<%# Eval("d_248")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_249" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!249!7"%>')">
                                <asp:Label ID="Label_tabela1349" runat="server" Text='<%# Eval("d_249")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_250" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!250!7"%>')">
                                <asp:Label ID="Label_tabela1350" runat="server" Text='<%# Eval("d_250")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_251" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!251!7"%>')">
                                <asp:Label ID="Label_tabela1351" runat="server" Text='<%# Eval("d_251")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_252" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!252!7"%>')">
                                <asp:Label ID="Label_tabela1352" runat="server" Text='<%# Eval("d_252")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_253" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!253!7"%>')">
                                <asp:Label ID="Label_tabela1353" runat="server" Text='<%# Eval("d_253")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_254" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!254!7"%>')">
                                <asp:Label ID="Label_tabela1354" runat="server" Text='<%# Eval("d_254")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_255" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!255!7"%>')">
                                <asp:Label ID="Label_tabela1355" runat="server" Text='<%# Eval("d_255")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_256" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!256!7"%>')">
                                <asp:Label ID="Label_tabela1356" runat="server" Text='<%# Eval("d_256")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_257" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!257!7"%>')">
                                <asp:Label ID="Label_tabela1357" runat="server" Text='<%# Eval("d_257")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_258" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!258!7"%>')">
                                <asp:Label ID="Label_tabela1358" runat="server" Text='<%# Eval("d_258")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_259" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!259!7"%>')">
                                <asp:Label ID="Label_tabela1359" runat="server" Text='<%# Eval("d_259")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_260" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!260!7"%>')">
                                <asp:Label ID="Label_tabela1360" runat="server" Text='<%# Eval("d_260")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_261" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!261!7"%>')">
                                <asp:Label ID="Label_tabela1361" runat="server" Text='<%# Eval("d_261")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_262" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!262!7"%>')">
                                <asp:Label ID="Label_tabela1362" runat="server" Text='<%# Eval("d_262")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_263" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!263!7"%>')">
                                <asp:Label ID="Label_tabela1363" runat="server" Text='<%# Eval("d_263")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_264" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!264!7"%>')">
                                <asp:Label ID="Label_tabela1364" runat="server" Text='<%# Eval("d_264")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_265" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!265!7"%>')">
                                <asp:Label ID="Label_tabela1365" runat="server" Text='<%# Eval("d_265")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_266" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!266!7"%>')">
                                <asp:Label ID="Label_tabela1366" runat="server" Text='<%# Eval("d_266")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_267" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!267!7"%>')">
                                <asp:Label ID="Label_tabela1367" runat="server" Text='<%# Eval("d_267")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_268" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!268!7"%>')">
                                <asp:Label ID="Label_tabela1368" runat="server" Text='<%# Eval("d_268")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_269" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!269!7"%>')">
                                <asp:Label ID="Label_tabela1369" runat="server" Text='<%# Eval("d_269")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_269" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!270!7"%>')">
                                <asp:Label ID="Label_tabela1370" runat="server" Text='<%# Eval("d_270")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_269" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!271!7"%>')">
                                <asp:Label ID="Label_tabela1371" runat="server" Text='<%# Eval("d_271")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_269" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!272!7"%>')">
                                <asp:Label ID="Label_tabela1372" runat="server" Text='<%# Eval("d_272")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_269" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!273!7"%>')">
                                <asp:Label ID="Label_tabela1373" runat="server" Text='<%# Eval("d_273")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_269" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!274!7"%>')">
                                <asp:Label ID="Label_tabela1374" runat="server" Text='<%# Eval("d_274")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_269" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!275!7"%>')">
                                <asp:Label ID="Label_tabela1375" runat="server" Text='<%# Eval("d_275")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_269" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!276!7"%>')">
                                <asp:Label ID="Label_tabela1376" runat="server" Text='<%# Eval("d_276")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                </Columns>

                <FooterStyle CssClass="gray" />

                <PagerStyle CssClass="gray" />
            </asp:GridView>

            <br />
        </div>
        <br />
        <div class="page-break">
            &nbsp;<asp:Label ID="Label7" runat="server" Text="Wyznaczenia i załatwienia w referatach sędziów"></asp:Label>
            &nbsp;&nbsp;&nbsp;
           <asp:Label ID="infoLabel2" runat="server" Text="tabela 2" Visible="False"></asp:Label>
            <br />

            <asp:GridView ID="gwTabela2" runat="server" OnRowCreated="naglowekTabeli_gwTabela2" AutoGenerateColumns="False" OnRowDataBound="stopkaTabeli_gwTabela2" Width="100%" ShowHeader="False" ShowFooter="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="L.p." SortExpression="id">
                        <ItemStyle Width="15px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="imie" SortExpression="imie">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("nazwisko") %>'></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("imie") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_160Fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_01" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!7"%>')">
                                <asp:Label ID="Label_tabela1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!7"%>')">
                                <asp:Label ID="Label_tabela1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!7"%>')">
                                <asp:Label ID="Label_tabela1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!7"%>')">
                                <asp:Label ID="Label_tabela1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!7"%>')">
                                <asp:Label ID="Label_tabela1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!7"%>')">
                                <asp:Label ID="Label_tabela1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!7"%>')">
                                <asp:Label ID="Label_tabela1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!7"%>')">
                                <asp:Label ID="Label_tabela1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!7"%>')">
                                <asp:Label ID="Label_tabela1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!7"%>')">
                                <asp:Label ID="Label_tabela1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!7"%>')">
                                <asp:Label ID="Label_tabela1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!7"%>')">
                                <asp:Label ID="Label_tabela1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!7"%>')">
                                <asp:Label ID="Label_tabela1113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!7"%>')">
                                <asp:Label ID="Label_tabela1114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!7"%>')">
                                <asp:Label ID="Label_tabela1115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_16" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!7"%>')">
                                <asp:Label ID="Label_tabela1116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_17" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!7"%>')">
                                <asp:Label ID="Label_tabela1117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_18" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!7"%>')">
                                <asp:Label ID="Label_tabela1118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_19" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!7"%>')">
                                <asp:Label ID="Label_tabela1119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_20" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!7"%>')">
                                <asp:Label ID="Label_tabela1120" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_21" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!7"%>')">
                                <asp:Label ID="Label_tabela1121" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_22" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!7"%>')">
                                <asp:Label ID="Label_tabela1122" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_23" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!7"%>')">
                                <asp:Label ID="Label_tabela1123" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_24" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!7"%>')">
                                <asp:Label ID="Label_tabela1124" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_25" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!7"%>')">
                                <asp:Label ID="Label_tabela1125" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_26" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!7"%>')">
                                <asp:Label ID="Label_tabela1126" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_27" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!7"%>')">
                                <asp:Label ID="Label_tabela1127" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_28" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!28!7"%>')">
                                <asp:Label ID="Label_tabela1128" runat="server" Text='<%# Eval("d_28")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_29" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!29!7"%>')">
                                <asp:Label ID="Label_tabela1129" runat="server" Text='<%# Eval("d_29")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_30" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!30!7"%>')">
                                <asp:Label ID="Label_tabela1130" runat="server" Text='<%# Eval("d_30")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_31" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!31!7"%>')">
                                <asp:Label ID="Label_tabela1131" runat="server" Text='<%# Eval("d_31")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_32" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!32!7"%>')">
                                <asp:Label ID="Label_tabela1132" runat="server" Text='<%# Eval("d_32")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_33" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!33!7"%>')">
                                <asp:Label ID="Label_tabela1133" runat="server" Text='<%# Eval("d_33")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_34" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!34!7"%>')">
                                <asp:Label ID="Label_tabela1134" runat="server" Text='<%# Eval("d_34")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_35" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!35!7"%>')">
                                <asp:Label ID="Label_tabela1135" runat="server" Text='<%# Eval("d_35")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_36" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!36!7"%>')">
                                <asp:Label ID="Label_tabela1136" runat="server" Text='<%# Eval("d_36")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_37" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!37!7"%>')">
                                <asp:Label ID="Label_tabela1137" runat="server" Text='<%# Eval("d_37")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_38" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!38!7"%>')">
                                <asp:Label ID="Label_tabela1138" runat="server" Text='<%# Eval("d_38")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_39" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!39!7"%>')">
                                <asp:Label ID="Label_tabela1139" runat="server" Text='<%# Eval("d_39")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_40" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!40!7"%>')">
                                <asp:Label ID="Label_tabela1140" runat="server" Text='<%# Eval("d_40")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_41" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!41!7"%>')">
                                <asp:Label ID="Label_tabela1141" runat="server" Text='<%# Eval("d_41")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_42" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!42!7"%>')">
                                <asp:Label ID="Label_tabela1142" runat="server" Text='<%# Eval("d_42")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_43" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!43!7"%>')">
                                <asp:Label ID="Label_tabela1143" runat="server" Text='<%# Eval("d_43")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_44" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!44!7"%>')">
                                <asp:Label ID="Label_tabela1144" runat="server" Text='<%# Eval("d_44")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_45" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!45!7"%>')">
                                <asp:Label ID="Label_tabela1145" runat="server" Text='<%# Eval("d_45")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_46" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!46!7"%>')">
                                <asp:Label ID="Label_tabela1146" runat="server" Text='<%# Eval("d_46")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_47" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!47!7"%>')">
                                <asp:Label ID="Label_tabela1147" runat="server" Text='<%# Eval("d_47")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_48" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!48!7"%>')">
                                <asp:Label ID="Label_tabela1148" runat="server" Text='<%# Eval("d_48")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_49" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!49!7"%>')">
                                <asp:Label ID="Label_tabela1149" runat="server" Text='<%# Eval("d_49")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_50" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!50!7"%>')">
                                <asp:Label ID="Label_tabela1150" runat="server" Text='<%# Eval("d_50")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_51" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!51!7"%>')">
                                <asp:Label ID="Label_tabela1151" runat="server" Text='<%# Eval("d_51")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_52" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!52!7"%>')">
                                <asp:Label ID="Label_tabela1152" runat="server" Text='<%# Eval("d_52")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_53" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!53!7"%>')">
                                <asp:Label ID="Label_tabela1153" runat="server" Text='<%# Eval("d_53")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_54" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!54!7"%>')">
                                <asp:Label ID="Label_tabela1154" runat="server" Text='<%# Eval("d_54")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_55" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!55!7"%>')">
                                <asp:Label ID="Label_tabela1155" runat="server" Text='<%# Eval("d_55")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_56" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!56!7"%>')">
                                <asp:Label ID="Label_tabela1156" runat="server" Text='<%# Eval("d_56")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_57" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!57!7"%>')">
                                <asp:Label ID="Label_tabela1157" runat="server" Text='<%# Eval("d_57")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_58" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!58!7"%>')">
                                <asp:Label ID="Label_tabela1158" runat="server" Text='<%# Eval("d_58")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_59" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!59!7"%>')">
                                <asp:Label ID="Label_tabela1159" runat="server" Text='<%# Eval("d_59")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_60" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!60!7"%>')">
                                <asp:Label ID="Label_tabela1160" runat="server" Text='<%# Eval("d_60")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_61" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!61!7"%>')">
                                <asp:Label ID="Label_tabela1161" runat="server" Text='<%# Eval("d_61")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_62" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!62!7"%>')">
                                <asp:Label ID="Label_tabela1162" runat="server" Text='<%# Eval("d_62")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_63" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!63!7"%>')">
                                <asp:Label ID="Label_tabela1163" runat="server" Text='<%# Eval("d_63")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_64" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!64!7"%>')">
                                <asp:Label ID="Label_tabela1164" runat="server" Text='<%# Eval("d_64")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_65" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!65!7"%>')">
                                <asp:Label ID="Label_tabela1165" runat="server" Text='<%# Eval("d_65")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_66" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!66!7"%>')">
                                <asp:Label ID="Label_tabela1166" runat="server" Text='<%# Eval("d_66")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_67" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!67!7"%>')">
                                <asp:Label ID="Label_tabela1167" runat="server" Text='<%# Eval("d_67")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_68" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!68!7"%>')">
                                <asp:Label ID="Label_tabela1168" runat="server" Text='<%# Eval("d_68")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_69" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!69!7"%>')">
                                <asp:Label ID="Label_tabela1169" runat="server" Text='<%# Eval("d_69")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_70" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!70!7"%>')">
                                <asp:Label ID="Label_tabela1170" runat="server" Text='<%# Eval("d_70")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_71" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!71!7"%>')">
                                <asp:Label ID="Label_tabela1171" runat="server" Text='<%# Eval("d_71")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_72" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!72!7"%>')">
                                <asp:Label ID="Label_tabela1172" runat="server" Text='<%# Eval("d_72")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_73" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!73!7"%>')">
                                <asp:Label ID="Label_tabela1173" runat="server" Text='<%# Eval("d_73")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_74" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!74!7"%>')">
                                <asp:Label ID="Label_tabela1174" runat="server" Text='<%# Eval("d_74")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_75" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!75!7"%>')">
                                <asp:Label ID="Label_tabela1175" runat="server" Text='<%# Eval("d_75")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_76" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!76!7"%>')">
                                <asp:Label ID="Label_tabela1176" runat="server" Text='<%# Eval("d_76")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_77" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!77!7"%>')">
                                <asp:Label ID="Label_tabela1177" runat="server" Text='<%# Eval("d_77")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_78" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!78!7"%>')">
                                <asp:Label ID="Label_tabela1178" runat="server" Text='<%# Eval("d_78")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_79" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!79!7"%>')">
                                <asp:Label ID="Label_tabela1179" runat="server" Text='<%# Eval("d_79")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_80" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!80!7"%>')">
                                <asp:Label ID="Label_tabela1180" runat="server" Text='<%# Eval("d_80")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_81" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!81!7"%>')">
                                <asp:Label ID="Label_tabela1181" runat="server" Text='<%# Eval("d_81")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_82" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!82!7"%>')">
                                <asp:Label ID="Label_tabela1182" runat="server" Text='<%# Eval("d_82")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_83" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!83!7"%>')">
                                <asp:Label ID="Label_tabela1183" runat="server" Text='<%# Eval("d_83")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_84" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!84!7"%>')">
                                <asp:Label ID="Label_tabela1184" runat="server" Text='<%# Eval("d_84")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_85" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!85!7"%>')">
                                <asp:Label ID="Label_tabela1185" runat="server" Text='<%# Eval("d_85")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_86" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!86!7"%>')">
                                <asp:Label ID="Label_tabela1186" runat="server" Text='<%# Eval("d_86")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_87" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!87!7"%>')">
                                <asp:Label ID="Label_tabela1187" runat="server" Text='<%# Eval("d_87")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_88" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!88!7"%>')">
                                <asp:Label ID="Label_tabela1188" runat="server" Text='<%# Eval("d_88")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_89" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!89!7"%>')">
                                <asp:Label ID="Label_tabela1189" runat="server" Text='<%# Eval("d_89")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_90" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!90!7"%>')">
                                <asp:Label ID="Label_tabela1190" runat="server" Text='<%# Eval("d_90")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_91" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!91!7"%>')">
                                <asp:Label ID="Label_tabela1191" runat="server" Text='<%# Eval("d_91")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_92" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!92!7"%>')">
                                <asp:Label ID="Label_tabela1192" runat="server" Text='<%# Eval("d_92")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_93" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!93!7"%>')">
                                <asp:Label ID="Label_tabela1193" runat="server" Text='<%# Eval("d_93")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_94" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!94!7"%>')">
                                <asp:Label ID="Label_tabela1194" runat="server" Text='<%# Eval("d_94")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_95" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!95!7"%>')">
                                <asp:Label ID="Label_tabela1195" runat="server" Text='<%# Eval("d_95")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_96" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!96!7"%>')">
                                <asp:Label ID="Label_tabela1196" runat="server" Text='<%# Eval("d_96")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_97" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!97!7"%>')">
                                <asp:Label ID="Label_tabela1197" runat="server" Text='<%# Eval("d_97")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_98" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!98!7"%>')">
                                <asp:Label ID="Label_tabela1198" runat="server" Text='<%# Eval("d_98")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_99" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!99!7"%>')">
                                <asp:Label ID="Label_tabela1199" runat="server" Text='<%# Eval("d_99")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_100" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!100!7"%>')">
                                <asp:Label ID="Label_tabela1200" runat="server" Text='<%# Eval("d_100")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_101" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!101!7"%>')">
                                <asp:Label ID="Label_tabela1201" runat="server" Text='<%# Eval("d_101")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_102" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!102!7"%>')">
                                <asp:Label ID="Label_tabela1202" runat="server" Text='<%# Eval("d_102")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_103" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!103!7"%>')">
                                <asp:Label ID="Label_tabela1203" runat="server" Text='<%# Eval("d_103")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_104" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!104!7"%>')">
                                <asp:Label ID="Label_tabela1204" runat="server" Text='<%# Eval("d_104")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!105!7"%>')">
                                <asp:Label ID="Label_tabela1205" runat="server" Text='<%# Eval("d_105")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!106!7"%>')">
                                <asp:Label ID="Label_tabela1206" runat="server" Text='<%# Eval("d_106")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!107!7"%>')">
                                <asp:Label ID="Label_tabela1207" runat="server" Text='<%# Eval("d_107")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!108!7"%>')">
                                <asp:Label ID="Label_tabela1208" runat="server" Text='<%# Eval("d_108")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!109!7"%>')">
                                <asp:Label ID="Label_tabela1209" runat="server" Text='<%# Eval("d_109")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!110!7"%>')">
                                <asp:Label ID="Label_tabela1210" runat="server" Text='<%# Eval("d_110")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!111!7"%>')">
                                <asp:Label ID="Label_tabela1211" runat="server" Text='<%# Eval("d_111")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!112!7"%>')">
                                <asp:Label ID="Label_tabela1212" runat="server" Text='<%# Eval("d_112")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!113!7"%>')">
                                <asp:Label ID="Label_tabela1213" runat="server" Text='<%# Eval("d_113")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!114!7"%>')">
                                <asp:Label ID="Label_tabela1214" runat="server" Text='<%# Eval("d_114")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!115!7"%>')">
                                <asp:Label ID="Label_tabela1215" runat="server" Text='<%# Eval("d_115")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!116!7"%>')">
                                <asp:Label ID="Label_tabela1216" runat="server" Text='<%# Eval("d_116")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!117!7"%>')">
                                <asp:Label ID="Label_tabela1217" runat="server" Text='<%# Eval("d_117")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!118!7"%>')">
                                <asp:Label ID="Label_tabela1218" runat="server" Text='<%# Eval("d_118")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!119!7"%>')">
                                <asp:Label ID="Label_tabela1219" runat="server" Text='<%# Eval("d_119")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!120!7"%>')">
                                <asp:Label ID="Label_tabela1220" runat="server" Text='<%# Eval("d_120")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest" />
                    </asp:TemplateField>

          
                </Columns>

                <FooterStyle CssClass="gray" />

                <PagerStyle CssClass="gray" />
            </asp:GridView>

            <br />
            <br />

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