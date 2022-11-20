$(document).ready(function() {
    
    var data = [];
    for (var i = 0; i < 20; i++) {
    	data.push({ id: 'NUM' + i.toString() + (i*10).toString(), name: 'Item ' + i });
    }

    var ViewModel = {
    	gridOptions: {
    		dataSource: new DevExpress.data.ArrayStore({
    			data: data,
    			key: 'id'
    		}),
    		columns: [
    			{
    				caption: '#',
    				cellTemplate: function(cellElement, cellInfo) {
    					cellElement.text(cellInfo.row.rowIndex)
    				}
    			},
    			'id',
    			'name'
    		], 
    		paging: {
    			pageSize: 10,
    		},   		
    	}
    };	

    ko.applyBindings(ViewModel);
});