ShinyBoxplotBuild <- function(data = datasets::precip, xlab, step = 1) {
  if (!requireNamespace("shiny", quietly = TRUE)) {
    stop("The shiny package is required")
  }

  if(missing(xlab)) {
    if(missing(data)) {
      xlab <- "precip"
    } else {
      xlab <- deparse(substitute(data))
    }
  }

  shiny::startApp(list(
    ui = shiny::shinyUI(shiny::fluidPage(
      shiny::titlePanel("BoxPlot Construction"),
      shiny::sidebarLayout(
        shiny::sidebarPanel(
          shiny::numericInput("step", "Step:", min = 1, max = 13, step = 1, value = step, width = '25%')
        ),
        shiny::mainPanel(
          shiny::plotOutput("bpPlot", height = '300px')
        )
      )
    )),
    server = shiny::shinyServer(function(input, output) {

      med <- median(data)
      q1 <- median(data[data < med])
      q3 <- median(data[data > med])
      iqr <- q3 - q1
      lf <- q1 - 1.5 * iqr
      uf <- q3 + 1.5 * iqr
      mn <- min(data[data >= lf])
      mx <- max(data[data <= uf])

      titles <- c("Set up Axis",
                  "Sort Data",
                  "Find Median",
                  "Find Q1 and Q3",
                  paste0("IQR = ", format(iqr, digits=3)),
                  paste0("q1 - 1.5 * IQR = ", format(lf, digits=3)),
                  paste0("q3 + 1.5 * IQR = ", format(uf, digits=3)),
                  "Minimum and Maximum within fences",
                  "Draw Lines",
                  "Draw Box",
                  "Draw Wiskers",
                  "Points for Potential Outliers",
                  ""
      )

      output$bpPlot <- shiny::renderPlot({

        plot.new()
        plot.window(xlim = range(pretty(c(data, lf, uf))), 
                    ylim = c(-1, 2))
        axis(1)

        if (input$step > 1 & input$step < 13) rug(data)
        if (input$step > 2 & input$step < 13) abline(v = med, col = '#228b2288')
        if (input$step > 3 & input$step < 13) abline(v = c(q1, q3), col = '#0000ff88')
        if (input$step > 5 & input$step < 13) abline(v = lf, col = '#ff000088')
        if (input$step > 6 & input$step < 13) abline(v = uf, col = '#ff000088')
        if (input$step > 7 & input$step < 13) abline(v = c(mn, mx), col = '#ff00ff88')
        if (input$step > 8) {
          segments(x0 = c(mn, q1, med, q3, mx), y0 = c(0.25, 0, 0, 0, 0.25),
                   y1 = c(0.75, 1, 1, 1, 0.75), lwd = c(1, 1, 3, 1, 1))
        }
        if (input$step > 9) {
          rect(q1, 0, q3, 1)
        }
        if (input$step > 10) {
          segments(x0 = c(mn, mx), x1 = c(q1, q3), y0 = 0.5, lty = 2)
        }
        if (input$step > 11) {
          points(data[data < lf | data > uf], 
            rep(0.5, sum(data < lf | data > uf)))
        }

        title(main = titles[input$step],
              xlab = xlab)

      })

    })
  ))
}
