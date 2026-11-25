ShinyCLTExamp <- function(n = 1, reps = 10000, nclass = 16,
                           norm.param = list(mean = 0, sd = 1),
                           gamma.param = list(shape = 1, rate = 1 / 3),
                           unif.param = list(min = 0, max = 1),
                           beta.param = list(shape1 = 0.35, shape2 = 0.25)) {
  if (!requireNamespace("shiny", quietly = TRUE)) {
    stop("The shiny package is required")
  }
  shiny::startApp(list(
    ui = shiny::shinyUI(shiny::fluidPage(

      shiny::titlePanel("Central Limit Theorem Demo"),

      shiny::fluidRow(
        shiny::plotOutput("cltPlot", "100%", height = "500px")
      ),

      shiny::fluidRow(
        shiny::column(2, shiny::numericInput('n', 'Sample Size', value = n)),
        shiny::column(10, ' ')
      )

    )),
    server = shiny::shinyServer(function(input, output, session) {
      output$cltPlot <- shiny::renderPlot({
        clt.examp(input$n, reps = reps, nclass = nclass,
                  norm.param = norm.param, gamma.param = gamma.param,
                  unif.param = unif.param, beta.param = beta.param)
      })

    })
  ))
}
