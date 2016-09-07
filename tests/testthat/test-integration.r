source("setup.r")
suppressMessages({

  test_that("no variation in time (a single period) is OK", {
    expect_silent(suppressMessages({
      d_in = shape(opinion[year == 2006],
             item_names = "Q_cces2006_abortion",
             time_name = "year",
             geo_name = "state",
             group_names = "female",
             survey_name = "source",
             weight_name = "weight")}))
    expect_silent({
      sink("/dev/null", type = "output")
      d_out = dgirt(d_in, iter = 30, chains = 1)
      as.data.frame(d_out)
      sink()
    })
  })

  test_that("no variation in survey identifier is OK", {
    expect_silent(suppressMessages({
      d_in = shape(opinion[source == "CCES_2006"],
             target_data = targets,
             target_proportion_name = "proportion",
             raking = ~ state,
             item_names = "Q_cces2006_abortion",
             time_name = "year",
             geo_name = "state",
             group_names = "female",
             survey_name = "source",
             weight_name = "weight")}))
    expect_silent({
      sink("/dev/null", type = "output")
      d_out = dgirt(d_in, iter = 30, chains = 1)
      as.data.frame(d_out)
      sink()
    })
  })

  test_that("no variation in geography produces an error", {
    expect_error(suppressMessages({
      d_in = shape(opinion[state == "MA"],
             item_names = "Q_cces2006_abortion",
             time_name = "year",
             geo_name = "state",
             group_names = "female",
             survey_name = "source",
             weight_name = "weight")
    }), "grouping variable 'state' doesn't vary")
  })

  test_that("no variation in grouping produces an error", {
    expect_error(suppressMessages({
      d_in = shape(opinion[female == "female"],
             item_names = "Q_cces2006_abortion",
             time_name = "year",
             geo_name = "state",
             group_names = "female",
             survey_name = "source",
             weight_name = "weight")
    }), "grouping variable 'female' doesn't vary")
  })

})