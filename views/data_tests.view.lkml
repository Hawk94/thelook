test: status_is_not_null {
  explore_source: order_items {
    column: status {}
    sort: {
      field: status
      desc: yes
    }
    limit: 1
  }
  assert: status_is_not_null {
    expression: NOT is_null(${order_items.status}) ;;
  }
}

test: historic_revenue_is_accurate {
  explore_source: orders {
    column: total_revenue { field: orders.total_revenue }
    filters: {
      field: orders.created_date
      value: "2017"
    }
  }
  assert: revenue_is_expected_value {
    expression: ${orders.total_revenue} = 626000 ;;
  }
}
