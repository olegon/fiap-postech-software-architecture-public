import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
// import * as sqs from 'aws-cdk-lib/aws-sqs';
import * as blueprints from '@aws-quickstart/eks-blueprints';

export class EksCdkStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // The code that defines your stack goes here

    // example resource
    // const queue = new sqs.Queue(this, 'EksCdkQueue', {
    //   visibilityTimeout: cdk.Duration.seconds(300)
    // });

    const stack = blueprints.EksBlueprint.builder()
      .account(props?.env?.account)
      .region(props?.env?.region)
      .build(scope, `${id}-eks-blueprint`);
  }
}
