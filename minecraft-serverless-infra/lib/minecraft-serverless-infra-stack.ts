import cdk = require('@aws-cdk/core');
import s3 = require('@aws-cdk/aws-s3');
import { countResources } from '@aws-cdk/assert';

export class MinecraftServerlessInfraStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // The code that defines your stack goes here
    const mcInfraBucket = new s3.Bucket(this,
      "mc-infra-bucket", {
        blockPublicAccess: s3.BlockPublicAccess.BLOCK_ALL
      });



      // outputs
      const mcInfraBucketOutput = new cdk.CfnOutput(this,
        'mcInfraBucketOutput', {
          exportName: 'mcInfraBucketOutput',
          value: mcInfraBucket.urlForObject()
        });
  }
}
