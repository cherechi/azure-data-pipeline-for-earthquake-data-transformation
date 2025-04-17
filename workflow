{
  "job_id": 739033082910520,
  "creator_user_name": "ndukwecherechi@yahoo.com",
  "run_as_user_name": "ndukwecherechi@yahoo.com",
  "run_as_owner": true,
  "settings": {
    "name": "Earthquake Pipeline",
    "email_notifications": {
      "no_alert_for_skipped_runs": false
    },
    "webhook_notifications": {},
    "timeout_seconds": 0,
    "schedule": {
      "quartz_cron_expression": "56 19 6 * * ?",
      "timezone_id": "UTC",
      "pause_status": "UNPAUSED"
    },
    "max_concurrent_runs": 1,
    "tasks": [
      {
        "task_key": "Bronze",
        "run_if": "ALL_SUCCESS",
        "notebook_task": {
          "notebook_path": "/Workspace/Users/ndukwecherechi@yahoo.com/Bronze Notebook",
          "source": "WORKSPACE"
        },
        "existing_cluster_id": "0327-122716-jjcxoo5l",
        "timeout_seconds": 0,
        "email_notifications": {},
        "webhook_notifications": {}
      },
      {
        "task_key": "Silver",
        "depends_on": [
          {
            "task_key": "Bronze"
          }
        ],
        "run_if": "ALL_SUCCESS",
        "notebook_task": {
          "notebook_path": "/Workspace/Users/ndukwecherechi@yahoo.com/Silver Notebook",
          "base_parameters": {
            "bronze_output": "{{tasks.Bronze.values.bronze_output}}"
          },
          "source": "WORKSPACE"
        },
        "existing_cluster_id": "0327-122716-jjcxoo5l",
        "timeout_seconds": 0,
        "email_notifications": {},
        "webhook_notifications": {}
      },
      {
        "task_key": "Gold",
        "depends_on": [
          {
            "task_key": "Silver"
          }
        ],
        "run_if": "ALL_SUCCESS",
        "notebook_task": {
          "notebook_path": "/Workspace/Users/ndukwecherechi@yahoo.com/Gold Notebook",
          "base_parameters": {
            "bronze_output": "{{tasks.Bronze.values.bronze_output}}",
            "silver_output": "{{tasks.Silver.values.silver_output}}"
          },
          "source": "WORKSPACE"
        },
        "existing_cluster_id": "0327-122716-jjcxoo5l",
        "timeout_seconds": 0,
        "email_notifications": {},
        "webhook_notifications": {}
      }
    ],
    "git_source": {
      "git_url": "https://github.com/cherechi/azure-data-pipeline-for-earthquake-data-transformation.git",
      "git_provider": "gitHub",
      "git_commit": "main"
    },
    "format": "MULTI_TASK",
    "queue": {
      "enabled": true
    }
  },
  "created_time": 1743682224228
}
