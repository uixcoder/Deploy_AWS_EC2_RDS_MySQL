provider "aws" {
  # region = "eu-north-1"
}


terraform {
  backend "s3" {
    bucket         = "pet2-clinic-project"
    key            = "pet2-clinic-tf.tfstate"
    encrypt        = true
    dynamodb_table = "pet2clinic-tf-lock"
  }

}





