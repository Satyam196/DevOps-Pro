"use strict";
const pulumi = require("@pulumi/pulumi");
const aws = require("@pulumi/aws");
const awsx = require("@pulumi/awsx");

// let sg = new aws.ec2.SecurityGroup("web-sg", {
//     ingress: [{protocol: 'tcp', fromPort: 80, toPort: 80, cidrBlocks: ["0.0.0.0/0"]}]
// })


// for (let i = 0; i < 3; i++) {
//     new aws.ec2.Instance(`web-${i}`, {
//         ami:"ami-0dfcb1ef8550277af",
//         instanceType: "t2.micro",
//         SecurityGroup: [sg.id],
//         tags:{
//             Name: `Machine-${i+1}`
//         },
//     })
// }