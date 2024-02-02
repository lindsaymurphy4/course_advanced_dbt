## Macro rolling_aggregation_n_periods
{% docs macro__rolling_aggregation_n_periods %}
Computes some rolling metric over the defined "n" periods aggregating using a defined function (ex. sum, avg, median, etc.)

This macro receives the following parameters:
1. column_name
2. partition_by
3. number_of_periods
4. aggregation_type
5. order_by

{% enddocs %}

### column_name
{% docs macro__rolling_aggregation_n_periods__column_name %}
Column with which the aggregation will be computed.
It should be a column available in the model in which the macro is going to be used.

{% enddocs %}

### partition_by
{% docs macro__rolling_aggregation_n_periods__partition_by %}
Name of the column that will be used to create the windows for the calculation.

{% enddocs %}

### number_of_periods
{% docs macro__rolling_aggregation_n_periods__number_of_periods %}
Number of periods within the partition to take into account for the aggregation.

Default value: 2
{% enddocs %}

### aggregation_type
{% docs macro__rolling_aggregation_n_periods__aggregation_type %}
Aggregating function to be applied to the "n" periods within a partition.
It must be a valid sql aggregating function.

Default value: 'avg'

{% enddocs %}

### order_by
{% docs macro__rolling_aggregation_n_periods__order_by %}
Column to be used to order the records within a partition.

Default value: created_at

{% enddocs %}
