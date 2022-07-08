provider "aws" {
  region = "eu-north-1"
}


terraform {
  backend "s3" {
    bucket         = "pet-clinic-project2"
    key            = "pet2-clinic-tf.tfstate"
    encrypt        = true
    dynamodb_table = "pet2clinic-tf-lock"
  }

}





