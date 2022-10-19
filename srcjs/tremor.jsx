import { Card, Text, Metric, Flex, ProgressBar } from '@tremor/react';
import { reactWidget } from 'reactR';
import React from 'react';

reactWidget('tremor', 'output', {
  Card: Card,
  Text: Text,
  Metric: Metric,
  ProgressBar: ProgressBar
});
