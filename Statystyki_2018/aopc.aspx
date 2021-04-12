<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aopc.aspx.cs" Inherits="Statystyki_2018.aopc" %>

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
                    <td style="width: auto; padding-left: 5px;">
                        <input id="Button1" class="ax_box" style="border-style: none; padding: 0px" type="button" onclick="JavaScript: window.print();" value="Drukuj" /></td>
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
            &nbsp;<asp:Label ID="Label1" runat="server" Text="Uzasadnienia"></asp:Label>
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
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!1!6"%>')">
                                <asp:Label ID="Label_gw1101" runat="server" Text='<%# Eval("d_01")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_02" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!2!6"%>')">
                                <asp:Label ID="Label_gw1102" runat="server" Text='<%# Eval("d_02")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_03" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!3!6"%>')">
                                <asp:Label ID="Label_gw1103" runat="server" Text='<%# Eval("d_03")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_04" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!4!6"%>')">
                                <asp:Label ID="Label_gw1104" runat="server" Text='<%# Eval("d_04")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_05" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!5!6"%>')">
                                <asp:Label ID="Label_gw1105" runat="server" Text='<%# Eval("d_05")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_06" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!6!6"%>')">
                                <asp:Label ID="Label_gw1106" runat="server" Text='<%# Eval("d_06")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_07" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!7!6"%>')">
                                <asp:Label ID="Label_gw1107" runat="server" Text='<%# Eval("d_07")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_08" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!8!6"%>')">
                                <asp:Label ID="Label_gw1108" runat="server" Text='<%# Eval("d_08")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_09" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!9!6"%>')">
                                <asp:Label ID="Label_gw1109" runat="server" Text='<%# Eval("d_09")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_10" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!10!6"%>')">
                                <asp:Label ID="Label_gw1110" runat="server" Text='<%# Eval("d_10")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_11" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!11!6"%>')">
                                <asp:Label ID="Label_gw1111" runat="server" Text='<%# Eval("d_11")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_12" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!12!6"%>')">
                                <asp:Label ID="Label_gw1112" runat="server" Text='<%# Eval("d_12")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_13" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!13!6"%>')">
                                <asp:Label ID="Label_gw1113" runat="server" Text='<%# Eval("d_13")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_14" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!14!6"%>')">
                                <asp:Label ID="Label_gw1114" runat="server" Text='<%# Eval("d_14")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_15" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!15!6"%>')">
                                <asp:Label ID="Label_gw1115" runat="server" Text='<%# Eval("d_15")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_16" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!16!6"%>')">
                                <asp:Label ID="Label_gw1116" runat="server" Text='<%# Eval("d_16")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_17" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!17!6"%>')">
                                <asp:Label ID="Label_gw1117" runat="server" Text='<%# Eval("d_17")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_18" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!18!6"%>')">
                                <asp:Label ID="Label_gw1118" runat="server" Text='<%# Eval("d_18")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_19" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!19!6"%>')">
                                <asp:Label ID="Label_gw1119" runat="server" Text='<%# Eval("d_19")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_20" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!20!6"%>')">
                                <asp:Label ID="Label_gw1120" runat="server" Text='<%# Eval("d_20")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_21" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!21!6"%>')">
                                <asp:Label ID="Label_gw1121" runat="server" Text='<%# Eval("d_21")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_22" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!22!6"%>')">
                                <asp:Label ID="Label_gw1122" runat="server" Text='<%# Eval("d_22")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_23" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!23!6"%>')">
                                <asp:Label ID="Label_gw1123" runat="server" Text='<%# Eval("d_23")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_24" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!24!6"%>')">
                                <asp:Label ID="Label_gw1124" runat="server" Text='<%# Eval("d_24")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_25" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!25!6"%>')">
                                <asp:Label ID="Label_gw1125" runat="server" Text='<%# Eval("d_25")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_26" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!26!6"%>')">
                                <asp:Label ID="Label_gw1126" runat="server" Text='<%# Eval("d_26")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_27" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!27!6"%>')">
                                <asp:Label ID="Label_gw1127" runat="server" Text='<%# Eval("d_27")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_28" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!28!6"%>')">
                                <asp:Label ID="Label_gw1128" runat="server" Text='<%# Eval("d_28")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_29" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!29!6"%>')">
                                <asp:Label ID="Label_gw1129" runat="server" Text='<%# Eval("d_29")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_30" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!30!6"%>')">
                                <asp:Label ID="Label_gw1130" runat="server" Text='<%# Eval("d_30")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_31" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!31!6"%>')">
                                <asp:Label ID="Label_gw1131" runat="server" Text='<%# Eval("d_31")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_32" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!32!6"%>')">
                                <asp:Label ID="Label_gw1132" runat="server" Text='<%# Eval("d_32")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_33" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!33!6"%>')">
                                <asp:Label ID="Label_gw1133" runat="server" Text='<%# Eval("d_33")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_34" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!34!6"%>')">
                                <asp:Label ID="Label_gw1134" runat="server" Text='<%# Eval("d_34")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_35" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!35!6"%>')">
                                <asp:Label ID="Label_gw1135" runat="server" Text='<%# Eval("d_35")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_36" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!36!6"%>')">
                                <asp:Label ID="Label_gw1136" runat="server" Text='<%# Eval("d_36")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_37" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!37!6"%>')">
                                <asp:Label ID="Label_gw1137" runat="server" Text='<%# Eval("d_37")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_38" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!38!6"%>')">
                                <asp:Label ID="Label_gw1138" runat="server" Text='<%# Eval("d_38")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_39" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!39!6"%>')">
                                <asp:Label ID="Label_gw1139" runat="server" Text='<%# Eval("d_39")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_40" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!40!6"%>')">
                                <asp:Label ID="Label_gw1140" runat="server" Text='<%# Eval("d_40")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_41" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!41!6"%>')">
                                <asp:Label ID="Label_gw1141" runat="server" Text='<%# Eval("d_41")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_42" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!42!6"%>')">
                                <asp:Label ID="Label_gw1142" runat="server" Text='<%# Eval("d_42")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_43" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!43!6"%>')">
                                <asp:Label ID="Label_gw1143" runat="server" Text='<%# Eval("d_43")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_44" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!44!6"%>')">
                                <asp:Label ID="Label_gw1144" runat="server" Text='<%# Eval("d_44")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_45" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!45!6"%>')">
                                <asp:Label ID="Label_gw1145" runat="server" Text='<%# Eval("d_45")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_46" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!46!6"%>')">
                                <asp:Label ID="Label_gw1146" runat="server" Text='<%# Eval("d_46")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_47" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!47!6"%>')">
                                <asp:Label ID="Label_gw1147" runat="server" Text='<%# Eval("d_47")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_48" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!48!6"%>')">
                                <asp:Label ID="Label_gw1148" runat="server" Text='<%# Eval("d_48")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_49" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!49!6"%>')">
                                <asp:Label ID="Label_gw1149" runat="server" Text='<%# Eval("d_49")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_50" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!50!6"%>')">
                                <asp:Label ID="Label_gw1150" runat="server" Text='<%# Eval("d_50")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_51" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!51!6"%>')">
                                <asp:Label ID="Label_gw1151" runat="server" Text='<%# Eval("d_51")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_52" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!52!6"%>')">
                                <asp:Label ID="Label_gw1152" runat="server" Text='<%# Eval("d_52")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_53" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!53!6"%>')">
                                <asp:Label ID="Label_gw1153" runat="server" Text='<%# Eval("d_53")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_54" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!54!6"%>')">
                                <asp:Label ID="Label_gw1154" runat="server" Text='<%# Eval("d_54")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_55" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!55!6"%>')">
                                <asp:Label ID="Label_gw1155" runat="server" Text='<%# Eval("d_55")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_56" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!56!6"%>')">
                                <asp:Label ID="Label_gw1156" runat="server" Text='<%# Eval("d_56")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_57" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!57!6"%>')">
                                <asp:Label ID="Label_gw1157" runat="server" Text='<%# Eval("d_57")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_58" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!58!6"%>')">
                                <asp:Label ID="Label_gw1158" runat="server" Text='<%# Eval("d_58")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_59" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!59!6"%>')">
                                <asp:Label ID="Label_gw1159" runat="server" Text='<%# Eval("d_59")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_60" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!60!6"%>')">
                                <asp:Label ID="Label_gw1160" runat="server" Text='<%# Eval("d_60")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_61" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!61!6"%>')">
                                <asp:Label ID="Label_gw1161" runat="server" Text='<%# Eval("d_61")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_62" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!62!6"%>')">
                                <asp:Label ID="Label_gw1162" runat="server" Text='<%# Eval("d_62")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_63" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!63!6"%>')">
                                <asp:Label ID="Label_gw1163" runat="server" Text='<%# Eval("d_63")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_64" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!64!6"%>')">
                                <asp:Label ID="Label_gw1164" runat="server" Text='<%# Eval("d_64")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_65" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!65!6"%>')">
                                <asp:Label ID="Label_gw1165" runat="server" Text='<%# Eval("d_65")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_66" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!66!6"%>')">
                                <asp:Label ID="Label_gw1166" runat="server" Text='<%# Eval("d_66")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_67" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!67!6"%>')">
                                <asp:Label ID="Label_gw1167" runat="server" Text='<%# Eval("d_67")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_68" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!68!6"%>')">
                                <asp:Label ID="Label_gw1168" runat="server" Text='<%# Eval("d_68")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_69" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!69!6"%>')">
                                <asp:Label ID="Label_gw1169" runat="server" Text='<%# Eval("d_69")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_70" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!70!6"%>')">
                                <asp:Label ID="Label_gw1170" runat="server" Text='<%# Eval("d_70")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_71" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!71!6"%>')">
                                <asp:Label ID="Label_gw1171" runat="server" Text='<%# Eval("d_71")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_72" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!72!6"%>')">
                                <asp:Label ID="Label_gw1172" runat="server" Text='<%# Eval("d_72")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_73" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!73!6"%>')">
                                <asp:Label ID="Label_gw1173" runat="server" Text='<%# Eval("d_73")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_74" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!74!6"%>')">
                                <asp:Label ID="Label_gw1174" runat="server" Text='<%# Eval("d_74")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_75" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!75!6"%>')">
                                <asp:Label ID="Label_gw1175" runat="server" Text='<%# Eval("d_75")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_76" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!76!6"%>')">
                                <asp:Label ID="Label_gw1176" runat="server" Text='<%# Eval("d_76")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_77" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!77!6"%>')">
                                <asp:Label ID="Label_gw1177" runat="server" Text='<%# Eval("d_77")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_78" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!78!6"%>')">
                                <asp:Label ID="Label_gw1178" runat="server" Text='<%# Eval("d_78")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_79" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!79!6"%>')">
                                <asp:Label ID="Label_gw1179" runat="server" Text='<%# Eval("d_79")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_80" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!80!6"%>')">
                                <asp:Label ID="Label_gw1180" runat="server" Text='<%# Eval("d_80")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_81" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!81!6"%>')">
                                <asp:Label ID="Label_gw1181" runat="server" Text='<%# Eval("d_81")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_82" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!82!6"%>')">
                                <asp:Label ID="Label_gw1182" runat="server" Text='<%# Eval("d_82")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_83" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!83!6"%>')">
                                <asp:Label ID="Label_gw1183" runat="server" Text='<%# Eval("d_83")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_84" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!84!6"%>')">
                                <asp:Label ID="Label_gw1184" runat="server" Text='<%# Eval("d_84")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_85" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!85!6"%>')">
                                <asp:Label ID="Label_gw1185" runat="server" Text='<%# Eval("d_85")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_86" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!86!6"%>')">
                                <asp:Label ID="Label_gw1186" runat="server" Text='<%# Eval("d_86")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_87" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!87!6"%>')">
                                <asp:Label ID="Label_gw1187" runat="server" Text='<%# Eval("d_87")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_88" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!88!6"%>')">
                                <asp:Label ID="Label_gw1188" runat="server" Text='<%# Eval("d_88")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_89" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!89!6"%>')">
                                <asp:Label ID="Label_gw1189" runat="server" Text='<%# Eval("d_89")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_90" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!90!6"%>')">
                                <asp:Label ID="Label_gw1190" runat="server" Text='<%# Eval("d_90")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_91" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!91!6"%>')">
                                <asp:Label ID="Label_gw1191" runat="server" Text='<%# Eval("d_91")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_92" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!92!6"%>')">
                                <asp:Label ID="Label_gw1192" runat="server" Text='<%# Eval("d_92")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_93" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!93!6"%>')">
                                <asp:Label ID="Label_gw1193" runat="server" Text='<%# Eval("d_93")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_94" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!94!6"%>')">
                                <asp:Label ID="Label_gw1194" runat="server" Text='<%# Eval("d_94")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_95" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!95!6"%>')">
                                <asp:Label ID="Label_gw1195" runat="server" Text='<%# Eval("d_95")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_96" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!96!6"%>')">
                                <asp:Label ID="Label_gw1196" runat="server" Text='<%# Eval("d_96")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_97" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!97!6"%>')">
                                <asp:Label ID="Label_gw1197" runat="server" Text='<%# Eval("d_97")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_98" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!98!6"%>')">
                                <asp:Label ID="Label_gw1198" runat="server" Text='<%# Eval("d_98")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_99" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!99!6"%>')">
                                <asp:Label ID="Label_gw1199" runat="server" Text='<%# Eval("d_99")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_100" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!100!6"%>')">
                                <asp:Label ID="Label_gw1200" runat="server" Text='<%# Eval("d_100")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_101" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!101!6"%>')">
                                <asp:Label ID="Label_gw1201" runat="server" Text='<%# Eval("d_101")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_102" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!102!6"%>')">
                                <asp:Label ID="Label_gw1202" runat="server" Text='<%# Eval("d_102")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_103" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!103!6"%>')">
                                <asp:Label ID="Label_gw1203" runat="server" Text='<%# Eval("d_103")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_104" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!104!6"%>')">
                                <asp:Label ID="Label_gw1204" runat="server" Text='<%# Eval("d_104")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_105" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!105!6"%>')">
                                <asp:Label ID="Label_gw1205" runat="server" Text='<%# Eval("d_105")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_106" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!106!6"%>')">
                                <asp:Label ID="Label_gw1206" runat="server" Text='<%# Eval("d_106")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_107" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!107!6"%>')">
                                <asp:Label ID="Label_gw1207" runat="server" Text='<%# Eval("d_107")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_108" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!108!6"%>')">
                                <asp:Label ID="Label_gw1208" runat="server" Text='<%# Eval("d_108")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_109" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!109!6"%>')">
                                <asp:Label ID="Label_gw1209" runat="server" Text='<%# Eval("d_109")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_110" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!110!6"%>')">
                                <asp:Label ID="Label_gw1210" runat="server" Text='<%# Eval("d_110")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="d_111" SortExpression="d_01">
                        <ItemTemplate>
                            <a href="javascript:openPopup('popup.aspx?sesja=<%# Eval("id_sedziego")+ "!"+Eval("id_tabeli") +"!111!6"%>')">
                                <asp:Label ID="Label_gw1211" runat="server" Text='<%# Eval("d_111")%>' CssClass="normal"></asp:Label>
                            </a>
                        </ItemTemplate>
                        <ItemStyle CssClass="col_80_fest_fest" />
                    </asp:TemplateField>
                
                </Columns>

                <FooterStyle CssClass="gray" />
            </asp:GridView>

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