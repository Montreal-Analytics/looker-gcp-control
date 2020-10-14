- dashboard: big_query_billing__usage
  title: Big Query Billing & Usage
  layout: newspaper
  elements:
  - title: Daily Costs
    name: Daily Costs
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_end_day_of_week,
      gcp_billing_export.usage_end_week]
    pivots: [gcp_billing_export.usage_end_week]
    filters:
      gcp_billing_export_project.name: GCP-billing,Analytics Warehouse
    sorts: [gcp_billing_export.usage_end_week, gcp_billing_export.usage_end_day_of_week]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Daily Cost}, {axisId: calculation_1,
            id: calculation_1, name: Cumulative Cost}], showLabels: false, showValues: true,
        valueFormat: "$#,###", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: ''
    label_value_format: "$#,###"
    series_types: {}
    series_colors:
      calculation_1: "#75E2E2"
    series_labels:
      calculation_1: Cumulative Cost
      gcp_billing_export.total_cost: Daily Cost
    label_color: [black]
    show_dropoff: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Reporting Date: gcp_billing_export.date_filter
    row: 3
    col: 0
    width: 24
    height: 10
  - title: Queries & Processed data
    name: Queries & Processed data
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: looker_line
    fields: [bigquery_data_access_job_statistics.create_date, bigquery_data_access.number_of_expensive_queries,
      bigquery_data_access_job_statistics.total_billed_terabytes, bigquery_data_access.number_of_queries]
    filters:
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_job_completed_event.event_name: query_job_completed
      bigquery_data_access_resource_labels.project_id: ''
    sorts: [bigquery_data_access_job_statistics.create_date desc]
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bigquery_data_access.number_of_queries,
            id: bigquery_data_access.number_of_queries, name: Number of Queries},
          {axisId: bigquery_data_access.number_of_expensive_queries, id: bigquery_data_access.number_of_expensive_queries,
            name: Number of Expensive Queries}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: bigquery_data_access_job_statistics.total_billed_terabytes,
            id: bigquery_data_access_job_statistics.total_billed_terabytes, name: Total
              Billed Terabytes}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    font_size: ''
    series_types:
      bigquery_data_access.number_of_queries: area
      bigquery_data_access.number_of_expensive_queries: column
      bigquery_data_access_job_statistics.total_billed_terabytes: column
    series_colors:
      bigquery_data_access.number_of_queries: "#C2DD67"
      bigquery_data_access_job_statistics.total_billed_terabytes: "#4276BE"
      bigquery_data_access.number_of_expensive_queries: "#B32F37"
    label_color: []
    defaults_version: 1
    listen:
      Reporting Date: bigquery_data_access_job_statistics.create_date
    row: 13
    col: 0
    width: 24
    height: 9
  - title: Expensive Queries Ratio
    name: Expensive Queries Ratio
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: looker_pie
    fields: [bigquery_data_access_job_statistics.total_billed_terabytes, bigquery_data_access.number_of_queries,
      bigquery_data_access.is_expensive]
    fill_fields: [bigquery_data_access.is_expensive]
    filters:
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_job_completed_event.event_name: query_job_completed
      bigquery_data_access_resource_labels.project_id: ''
    sorts: [bigquery_data_access.is_expensive]
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
      options:
        steps: 5
    series_colors: {}
    series_labels:
      bigquery_data_access.number_of_queries: Total Queries
      'No': Regular Queries
      'Yes': Expensive Queries (over 30 Gb)
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: bigquery_data_access.number_of_queries,
            id: bigquery_data_access.number_of_queries, name: Number of Queries},
          {axisId: bigquery_data_access.number_of_expensive_queries, id: bigquery_data_access.number_of_expensive_queries,
            name: Number of Expensive Queries}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: bigquery_data_access_job_statistics.total_billed_terabytes,
            id: bigquery_data_access_job_statistics.total_billed_terabytes, name: Total
              Billed Terabytes}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    font_size: '19'
    series_types: {}
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    charts_across: 2
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [bigquery_data_access_job_statistics.total_billed_terabytes]
    hidden_points_if_no:
    listen:
      Reporting Date: bigquery_data_access_job_statistics.create_date
    row: 22
    col: 0
    width: 12
    height: 7
  - title: Expensive Queries Ratio (Billed Tb)
    name: Expensive Queries Ratio (Billed Tb)
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: looker_pie
    fields: [bigquery_data_access_job_statistics.total_billed_terabytes, bigquery_data_access.number_of_queries,
      bigquery_data_access.is_expensive]
    fill_fields: [bigquery_data_access.is_expensive]
    filters:
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_job_completed_event.event_name: query_job_completed
      bigquery_data_access_resource_labels.project_id: ''
    sorts: [bigquery_data_access.is_expensive]
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
      options:
        steps: 5
    series_colors: {}
    series_labels:
      bigquery_data_access.number_of_queries: Total Queries
      'No': Regular Queries
      'Yes': Expensive Queries (over 30 Gb)
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: bigquery_data_access.number_of_queries,
            id: bigquery_data_access.number_of_queries, name: Number of Queries},
          {axisId: bigquery_data_access.number_of_expensive_queries, id: bigquery_data_access.number_of_expensive_queries,
            name: Number of Expensive Queries}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: bigquery_data_access_job_statistics.total_billed_terabytes,
            id: bigquery_data_access_job_statistics.total_billed_terabytes, name: Total
              Billed Terabytes}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    font_size: '19'
    series_types: {}
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    label_color: []
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    charts_across: 2
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [bigquery_data_access.number_of_queries]
    hidden_points_if_no:
    listen:
      Reporting Date: bigquery_data_access_job_statistics.create_date
    row: 22
    col: 12
    width: 12
    height: 7
  - title: PDTs Builds
    name: PDTs Builds
    model: system__activity
    explore: pdt_builds
    type: looker_line
    fields: [pdt_builds.view_name, pdt_builds.count, pdt_builds.average_build_time_seconds,
      pdt_builds.start_hour]
    pivots: [pdt_builds.view_name]
    fill_fields: [pdt_builds.start_hour]
    filters:
      pdt_builds.workspace: prod
      pdt_builds.view_name: ''
    sorts: [pdt_builds.view_name 0, pdt_builds.start_hour desc]
    limit: 500
    total: true
    row_total: right
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_series: [Row Total - pdt_builds.count]
    series_types: {}
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [pdt_builds.average_build_time_seconds]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
    listen:
      Reporting Date: pdt_builds.start_date
    row: 29
    col: 0
    width: 24
    height: 12
  - title: Queries by Source
    name: Queries by Source
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.issuer_source, history.query_run_count, history.cache_result_query_count,
      history.database_result_query_count, history.source, history.created_hour]
    pivots: [history.issuer_source, history.source]
    filters:
      history.issuer_source: System,User
      history.connection_name: warehouse
      history.source: regenerator,dashboard,explore,look
    sorts: [history.issuer_source 0, history.source 0, history.created_hour desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [history.query_run_count]
    defaults_version: 1
    hidden_series: [System - regenerator - history.cache_result_query_count]
    listen:
      Reporting Date: history.created_date
    row: 53
    col: 0
    width: 24
    height: 10
  - title: Average Runtime by Source
    name: Average Runtime by Source
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.issuer_source, history.source, history.created_hour, history.average_runtime]
    pivots: [history.issuer_source, history.source]
    filters:
      history.issuer_source: System,User
      history.connection_name: warehouse
      history.source: regenerator,dashboard,explore,look
    sorts: [history.issuer_source 0, history.source 0, history.created_hour desc]
    limit: 500
    column_limit: 50
    row_total: right
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_series: [System - regenerator - history.cache_result_query_count, User
        - look - history.average_runtime, User - explore - history.average_runtime,
      User - dashboard - history.average_runtime, System - regenerator - history.average_runtime]
    series_colors:
      Row Total - history.average_runtime: "#000000"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    hidden_fields: []
    defaults_version: 1
    listen:
      Reporting Date: history.created_date
    row: 82
    col: 0
    width: 24
    height: 9
  - title: Total Billing Amount
    name: Total Billing Amount
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_cost]
    filters:
      gcp_billing_export_project.name: GCP-billing,Analytics Warehouse
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#3EB0D5"
    single_value_title: Period Billing Amount
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Daily Cost}, {axisId: calculation_1,
            id: calculation_1, name: Cumulative Cost}], showLabels: false, showValues: true,
        valueFormat: "$#,###", unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: ''
    label_value_format: "$#,###"
    series_types: {}
    series_colors:
      calculation_1: "#75E2E2"
    series_labels:
      calculation_1: Cumulative Cost
      gcp_billing_export.total_cost: Daily Cost
    label_color: [black, transparent]
    defaults_version: 1
    listen:
      Reporting Date: gcp_billing_export.date_filter
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Total Billed TB
    name: Total Billed TB
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: single_value
    fields: [bigquery_data_access_job_statistics.total_billed_terabytes]
    filters:
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_job_completed_event.event_name: query_job_completed
      bigquery_data_access_resource_labels.project_id: ''
      bigquery_data_access.date_filter: 30 days
    limit: 500
    column_limit: 50
    total: true
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4276BE"
    single_value_title: Total Billed Terabytes
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bigquery_data_access.number_of_queries,
            id: bigquery_data_access.number_of_queries, name: Number of Queries},
          {axisId: bigquery_data_access.number_of_expensive_queries, id: bigquery_data_access.number_of_expensive_queries,
            name: Number of Expensive Queries}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: bigquery_data_access_job_statistics.total_billed_terabytes,
            id: bigquery_data_access_job_statistics.total_billed_terabytes, name: Total
              Billed Terabytes}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    font_size: ''
    series_types: {}
    series_colors:
      bigquery_data_access.number_of_queries: "#C2DD67"
      bigquery_data_access_job_statistics.total_billed_terabytes: "#4276BE"
      bigquery_data_access.number_of_expensive_queries: "#B32F37"
    label_color: []
    defaults_version: 1
    listen:
      Reporting Date: bigquery_data_access_job_statistics.create_date
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Total Expensive Queries
    name: Total Expensive Queries
    model: gcp_bigquery_logs
    explore: bigquery_data_access
    type: single_value
    fields: [bigquery_data_access.number_of_expensive_queries, bigquery_data_access.number_of_queries]
    filters:
      bigquery_data_access_payload.service_name: bigquery.googleapis.com
      bigquery_data_access_payload.method_name: jobservice.jobcompleted
      bigquery_data_access_job_completed_event.event_name: query_job_completed
      bigquery_data_access_resource_labels.project_id: ''
      bigquery_data_access.date_filter: 30 days
    limit: 500
    column_limit: 50
    total: true
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#B32F37"
    single_value_title: Total Expensive Queries
    comparison_label: total Queries
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bigquery_data_access.number_of_queries,
            id: bigquery_data_access.number_of_queries, name: Number of Queries},
          {axisId: bigquery_data_access.number_of_expensive_queries, id: bigquery_data_access.number_of_expensive_queries,
            name: Number of Expensive Queries}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: bigquery_data_access_job_statistics.total_billed_terabytes,
            id: bigquery_data_access_job_statistics.total_billed_terabytes, name: Total
              Billed Terabytes}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    font_size: ''
    series_types: {}
    series_colors:
      bigquery_data_access.number_of_queries: "#C2DD67"
      bigquery_data_access_job_statistics.total_billed_terabytes: "#4276BE"
      bigquery_data_access.number_of_expensive_queries: "#B32F37"
    label_color: []
    defaults_version: 1
    listen:
      Reporting Date: bigquery_data_access_job_statistics.create_date
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Queries by Source (daily)
    name: Queries by Source (daily)
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.issuer_source, history.query_run_count, history.cache_result_query_count,
      history.database_result_query_count, history.source, history.created_date]
    pivots: [history.issuer_source, history.source]
    fill_fields: [history.created_date]
    filters:
      history.issuer_source: System,User
      history.connection_name: warehouse
      history.source: regenerator,dashboard,explore,look
    sorts: [history.issuer_source 0, history.source 0]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [history.query_run_count]
    defaults_version: 1
    hidden_series: [System - regenerator - history.cache_result_query_count]
    listen:
      Reporting Date: history.created_date
    row: 63
    col: 0
    width: 24
    height: 10
  - title: Average Runtime by Source (daily)
    name: Average Runtime by Source (daily)
    model: system__activity
    explore: history
    type: looker_line
    fields: [history.issuer_source, history.source, history.average_runtime, history.created_date]
    pivots: [history.issuer_source, history.source]
    filters:
      history.issuer_source: System,User
      history.connection_name: warehouse
      history.source: regenerator,dashboard,explore,look
    sorts: [history.issuer_source 0, history.source 0]
    limit: 500
    column_limit: 50
    row_total: right
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_series: [System - regenerator - history.cache_result_query_count, User
        - look - history.average_runtime, User - explore - history.average_runtime,
      User - dashboard - history.average_runtime, System - regenerator - history.average_runtime]
    series_colors:
      Row Total - history.average_runtime: "#000000"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    hidden_fields: []
    defaults_version: 1
    listen:
      Reporting Date: history.created_date
    row: 73
    col: 0
    width: 24
    height: 9
  - name: Most Costly Queries (Top 50)
    title: Most Costly Queries (Top 50)
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [history.id, query.id, query.link, history.source, history.message,
        history.total_runtime, history.real_dash_id, dashboard.link]
      filters:
        history.result_source: query
        history.status: complete
        # history.created_date: 72 hours
      sorts: [history.total_runtime desc]
      limit: 5000
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: gcp_bigquery_logs
      explore: bigquery_data_access
      type: looker_grid
      fields: [bigquery_data_access_query.history_id, bigquery_data_access_job_statistics.total_billed_gigabytes,
        bigquery_data_access_job_statistics.total_query_cost, bigquery_data_access_job_statistics.average_query_runtime]
      filters:
        bigquery_data_access.is_expensive: 'Yes'
        bigquery_data_access_payload.method_name: jobservice.jobcompleted
        bigquery_data_access_resource_labels.project_id: ''
        bigquery_data_access_payload.service_name: bigquery.googleapis.com
        bigquery_data_access_job_completed_event.event_name: query_job_completed
        # bigquery_data_access_job_statistics.create_date: 72 hours
        bigquery_data_access_job_statistics.total_billed_terabytes: ">=0.04"
        bigquery_data_access_job_statistics.total_billed_gigabytes: ''
      sorts: [bigquery_data_access_job_statistics.total_billed_gigabytes desc]
      limit: 5000
      column_limit: 50
      total: true
      query_timezone: America/Los_Angeles
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      series_types: {}
      join_fields:
      - field_name: bigquery_data_access_query.history_id
        source_field_name: history.id
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      history.total_runtime:
        is_active: true
      bigquery_data_access_job_statistics.total_billed_gigabytes:
        is_active: true
      bigquery_data_access_job_statistics.total_query_cost:
        is_active: false
      bigquery_data_access_job_statistics.average_query_runtime:
        is_active: true
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    sorts: [bigquery_data_access_job_statistics.total_billed_gigabytes desc]
    listen:
    - Reporting Date: history.created_date
    - Reporting Date: bigquery_data_access_job_statistics.create_date
    row: 91
    col: 0
    width: 24
    height: 9
  - title: PDTs Builds (daily)
    name: PDTs Builds (daily)
    model: system__activity
    explore: pdt_builds
    type: looker_line
    fields: [pdt_builds.view_name, pdt_builds.count, pdt_builds.average_build_time_seconds,
      pdt_builds.start_date]
    pivots: [pdt_builds.view_name]
    fill_fields: [pdt_builds.start_date]
    filters:
      pdt_builds.workspace: prod
      pdt_builds.view_name: ''
    sorts: [pdt_builds.view_name 0]
    limit: 500
    total: true
    row_total: right
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_series: [Row Total - pdt_builds.count]
    series_types: {}
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [pdt_builds.average_build_time_seconds]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
    listen:
      Reporting Date: pdt_builds.start_date
    row: 41
    col: 0
    width: 24
    height: 12
  filters:
  - name: Reporting Date
    title: Reporting Date
    type: date_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
