SELECT DATE(start_time) as date,
TIMESTAMPDIFF(MINUTE,TIME(end_time),TIME(start_time)) as average_response_time;