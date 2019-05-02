# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: [" おすすめ　　", " おすすめできない"],
            datasets: [{
                label: '',
                data:  gon.data,
                backgroundColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)',

                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255,99,132,1)',


                ],
                borderWidth: 1
            }]
        },
        options: {

          legend: {
            labels: {
                  fontColor: 'black',
                  fontSize: 20

            }
        }
        }
    })
