---
layout: default
title: AWS
---

## {{ page.title }}

This page describes how to set up a new [Amazon Web Services
(AWS)](https://aws.amazon.com/) account that restricts the regions that can be
used.

I tend to forget checking the region when creating resources in AWS.
As a result, I use an AWS Organization and Service Control Policies (SCPs) to
restrict creating resources to two specific regions.

### Create an account to manage the AWS Organization

The first step is to create the account that manages the AWS Organization itself.
This account is **not** subject to the SCPs that you attach to the AWS
Organization.
Go to [AWS](https://aws.amazon.com/) and navigate to `Create an AWS Account`.
I explicitly don't include a link here, because those kind of deep links tend
to be invalid after some time.

In the form that pops up, enter the email address for the account that shall
manage the AWS Organization.
This cannot be the same email address as will be used for the additional
accounts that will be created later.
Also, choose a strong password.

There is a field labeled `AWS account name`.
Here, I use something that makes it clear that this is not an ordinary account
for a person.
In the past, I have used `Master` or `Foo Bar GmbH Master`.

### Create an AWS Organization

Once you have created the account to manage the AWS Organization, it is time to
create the AWS Organization itself.
Log in to the [AWS Management Console](https://console.aws.amazon.com/) and
navigate to `My Organization` which is located in one of the top menus.
Here, navigate to `Create Organization` and follow the procedure.

Once you have created the AWS Organization, you will receive an email to
confirm you email address.
Click on the confirmation link before continuing.

### Create the SCPs

While still being logged in with the `Master` account, navigate to the
`Policies` tab in the [AWS Organizations Control Panel](https://console.aws.amazon.com/organizations/home).
Here, first activate SCPs and then create the following
[policy](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_example-scps.html#example-scp-deny-region).
I tend to name it the same way as the `Sid`, i.e., I name it `DenyAllOutsideEU`.
The description could be `Deny access to resources outside eu-central-1 and
eu-west-1`, as I do not have to take a look at the policy itself to figure out
what resources are in there for this specific account.

    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "DenyAllOutsideEU",
                "Effect": "Deny",
                "NotAction": [
                   "a4b:*", "artifact:*", "aws-portal:*",
                    "budgets:*",
                    "ce:*", "chime:*", "cloudfront:*", "cur:*",
                    "datapipeline:GetAccountLimits", "directconnect:",
                    "globalaccelerator:*",
                    "health:*",
                    "iam:*", "importexport:*",
                    "mobileanalytics:*",
                    "organizations:*",
                    "resource-groups:*", "route53:*", "route53domains:*",
                    "s3:GetBucketLocation", "s3:ListAllMyBuckets", "shield:*", "support:*",
                    "tag:*", "trustedadvisor:*",
                    "waf:*",
                    "wellarchitected:*"
                ],
                "Resource": "*",
                "Condition": {
                    "StringNotEquals": {
                        "aws:RequestedRegion": [
                            "eu-central-1",
                            "eu-west-1"
                        ]
                    }
                }
            }
        ]
    }

Now, the policy has to be actually applied.
Navigate to `Organize accounts`, then `Root`, then `Service control policies`
and you will find that `DenyAllOutsideEU` is currently detached from the `Root`.
`Attach` it.

Leave `FullAWSAccess` attached to the `Root` as an SCP's `Deny` statement
overrides any `Allow` statement.
See [the documentation](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps-about.html)
for further details.

### Create an additional AWS account

This additional AWS account will be attached to the just created AWS
Organization and is thus subject to the attched SCPs.

While still being logged in with the `Master` account, navigate to the
`Accounts` tab in the [AWS Organizations Control Panel](https://console.aws.amazon.com/organizations/home).
Here, click on `Add account` and follow the procedure to `Create [an] account`.

For the account name I tend to use the type of the account.
This could be `Development`, `Staging`, `Production`, or `Shared Services`.

Note that you cannot use the same email address as has been used for the master
account.

You may have to reset your password when trying to log in the first time as no
password has been chosen for the additional account.

### Further steps

You now want to create IAM accounts, enable two factor authentication, or
whatever is now state of the art to secure your AWS accounts.

### Summary

At this point, you should have a master account and one additional account.
Notice how the AWS Management Console denies access to services and resources
when you have selected the wrong region.
Also notice how this only happens with the additional account, but not with the
master account.

As an example, the following error message is shown when navigating to AWS
Lambda in `us-west-1` (Ohio) using the `Development` account.

    You are not authorized to perform: lambda:GetAccountSettings.
