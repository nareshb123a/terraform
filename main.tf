resource "aws_transfer_server" "test1" {
  endpoint_type = "PUBLIC"
  protocols = ["SFTP"]
  logging_role = "arn:aws:iam::600627357905:role/transfer2"
  workflow_details {
    on_upload {
      execution_role = "arn:aws:iam::600627357905:role/transfer2"
      workflow_id    = aws_transfer_workflow.test11.id
    }
  }
}

resource "aws_transfer_workflow" "test11" {
  steps {
    delete_step_details {
      name = "test"
      source_file_location = "$${original.file}"
    }
    type = "DELETE"
  }
}