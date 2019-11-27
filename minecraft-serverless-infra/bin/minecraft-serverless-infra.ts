#!/usr/bin/env node
import 'source-map-support/register';
import cdk = require('@aws-cdk/core');
import { MinecraftServerlessInfraStack } from '../lib/minecraft-serverless-infra-stack';

const app = new cdk.App();
new MinecraftServerlessInfraStack(app, 'MinecraftServerlessInfraStack');
