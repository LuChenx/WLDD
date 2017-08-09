/**
 * 
 */
 $('#mytable').bootstrapTable({
                 //请求方法
                method: 'post',
                 //是否显示行间隔色
                striped: true,
                //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）     
                cache: false,    
                //是否显示分页（*）  
                pagination: true,   
                 //是否启用排序  
                sortable: false,    
                 //排序方式 
                sortOrder: "asc",    
                //初始化加载第一页，默认第一页
                //我设置了这一项，但是貌似没起作用，而且我这默认是0,- -
                //pageNumber:1,   
                //每页的记录行数（*）   
                pageSize: 10,  
                //可供选择的每页的行数（*）    
                pageList: [10, 25, 50, 100],
                //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据  
                url: "/test/testtable.action",
                //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
                //queryParamsType:'',   
                ////查询参数,每次调用是会带上这个参数，可自定义                         
/*                queryParams: queryParams : function(params) {
                    var subcompany = $('#subcompany option:selected').val();
                    var name = $('#name').val();
                    return {
                          pageNumber: params.offset+1,
                          pageSize: params.limit,
                          companyId:subcompany,
                          name:name
                        };
                },*/
                //分页方式：client客户端分页，server服务端分页（*）
                sidePagination: "client",
                //是否显示搜索
                search: false,  
                //Enable the strict search.    
                strictSearch: true,
                //Indicate which field is an identity field.
                idField : "id",
                columns: [{
                    field: 'id',
                    title: 'id',
                    align: 'center'
                }, {
                    field: 'testkey',
                    title: '测试标识',
                    align: 'center'
                }, {
                    field: 'testname',
                    title: '测试名字',
                    align: 'center'
                },{
                    field: 'id',
                    title: '操作',
                    align: 'center',
                    formatter:function(value,row,index){
                        //通过formatter可以自定义列显示的内容
                        //value：当前field的值，即id
                        //row：当前行的数据
                        var a = '<a href="" >测试</a>';
                    } 
                }],
                pagination:true
            });