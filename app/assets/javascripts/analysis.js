var Analysis = {
  setup: function (data) {
    console.log(data);
      $('.chart').highcharts({
                chart: {
                        type: 'spline'
                },
                title: {
                        text: data.title
                },
                subtitle: {
                        text: data.subtitle
                },
                xAxis: {
                        categories: data.data.collect,
                        type: 'datetime',
                        labels: {
                                overflow: 'justify'
                        }
                },
                yAxis: {
                        title: {
                                text: data.yAxis
                        },
                        minorGridLineWidth: 0,
                        gridLineWidth: 0,
                        alternateGridColor: null                        
                },
                plotOptions: {
                        spline: {
                                lineWidth: 4,
                                states: {
                                        hover: {
                                                lineWidth: 5
                                        }
                                },
                                marker: {
                                        enabled: false
                                }
                        }
                },
                series: [{
                        name: 'Percentual de gordura',
                        data: data.data.fat
                }, {
                        name: 'Percentual de proteina',
                        data: data.data.protein
                },{
                        name: 'Percentual de lactose',
                        data: data.data.lactose
                }, {
                        name: 'Percentual extra seco (Sólidos totais)',
                        data: data.data.totalsolids
                }, {
                        name: 'Percentual extrato desengordurado',
                        data: data.data.defattedextract
                }, {
                        name: 'Contagem de células somáticas CSS',
                        data: data.data.css
                }, {
                        name: 'Escore de células somáticas',
                        data: data.data.scorecss
                }, {
                        name: 'Contagem bacteriana UFC',
                        data: data.data.ufc
                }],
                navigation: {
                        menuItemStyle: {
                                fontSize: '10px'
                        }
                }
        });
    }
};

